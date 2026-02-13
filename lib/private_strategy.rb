require "download_strategy"

# Unique class names to avoid collision with other taps that define
# GitHubPrivateRepositoryDownloadStrategy / ...ReleaseDownloadStrategy.
# Uses `gh auth token --user <owner>` to pick the correct GitHub account
# based on the repo owner parsed from the URL.

class FishfisherPrivateDownloadStrategy < CurlDownloadStrategy
  def initialize(url, name, version, **meta)
    super
    parse_url_pattern
    set_github_token
  end

  def parse_url_pattern
    unless match = url.match(%r{https://github.com/([^/]+)/([^/]+)/(\S+)})
      raise CurlDownloadStrategyError, "Invalid url pattern for GitHub Repository."
    end
    _, @owner, @repo, @filepath = *match
  end

  def download_url
    "https://#{@github_token}@github.com/#{@owner}/#{@repo}/#{@filepath}"
  end

  private

  def _fetch(url:, resolved_url:, timeout:)
    curl_download download_url, to: temporary_path
  end

  def set_github_token
    @github_token = ENV["HOMEBREW_GITHUB_API_TOKEN"]
    return unless @github_token.to_s.empty?

    gh = %w[/opt/homebrew/bin/gh /usr/local/bin/gh /usr/bin/gh].find { |p| File.executable?(p) }
    if gh
      # Try owner-specific token first, fall back to active account
      token = `#{gh} auth token --user #{@owner} 2>/dev/null`.strip
      token = `#{gh} auth token 2>/dev/null`.strip if token.empty?
      @github_token = token unless token.empty?
    end
    unless @github_token
      raise CurlDownloadStrategyError,
            "GitHub token required. Set HOMEBREW_GITHUB_API_TOKEN or run: gh auth login"
    end
  end
end

class FishfisherPrivateReleaseDownloadStrategy < FishfisherPrivateDownloadStrategy
  def parse_url_pattern
    url_pattern = %r{https://github.com/([^/]+)/([^/]+)/releases/download/([^/]+)/(\S+)}
    unless @url =~ url_pattern
      raise CurlDownloadStrategyError, "Invalid url pattern for GitHub Release."
    end
    _, @owner, @repo, @tag, @filename = *@url.match(url_pattern)
  end

  def download_url
    "https://#{@github_token}@api.github.com/repos/#{@owner}/#{@repo}/releases/assets/#{asset_id}"
  end

  def resolve_url_basename_time_file_size(url, timeout: nil)
    [download_url, @filename, nil, nil, nil, false]
  end

  private

  def _fetch(url:, resolved_url:, timeout:)
    curl_download download_url,
                  "--header", "Accept: application/octet-stream",
                  to: temporary_path
  end

  def asset_id
    @asset_id ||= resolve_asset_id
  end

  def resolve_asset_id
    release_metadata = fetch_release_metadata
    assets = release_metadata["assets"].select { |a| a["name"] == @filename }
    raise CurlDownloadStrategyError, "Asset '#{@filename}' not found in release #{@tag}." if assets.empty?
    assets.first["id"]
  end

  def fetch_release_metadata
    require "json"
    release_url = "https://api.github.com/repos/#{@owner}/#{@repo}/releases/tags/#{@tag}"
    output = `curl -sS -H "Authorization: token #{@github_token}" -H "Accept: application/vnd.github+json" "#{release_url}" 2>/dev/null`
    JSON.parse(output)
  end
end
