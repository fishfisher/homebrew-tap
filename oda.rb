require_relative "lib/private_strategy"

class Oda < Formula
  desc "CLI for ordering groceries from Oda.com"
  homepage "https://github.com/fishfisher/oda-cli"
  version "1.0.4"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/fishfisher/oda-cli/releases/download/v1.0.4/oda-darwin-arm64",
        using: GitHubPrivateRepositoryReleaseDownloadStrategy
    sha256 "5196cd993d10ded07bde914fd2f049b8b58a8d2a520ffedcbf54d1b0f3c55a62"
  end

  on_intel do
    url "https://github.com/fishfisher/oda-cli/releases/download/v1.0.4/oda-darwin-amd64",
        using: GitHubPrivateRepositoryReleaseDownloadStrategy
    sha256 "2a7874763e2d323e437b0ba046448d5953e0c6d3cb8661eb615e2b24a811348d"
  end

  def install
    bin.install Dir["oda*"].first => "oda"
  end

  test do
    assert_match "Oda", shell_output("#{bin}/oda --help")
  end
end
