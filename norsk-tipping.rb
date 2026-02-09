require_relative "lib/private_strategy"

class NorskTipping < Formula
  desc "CLI for buying lottery tickets from Norsk Tipping"
  homepage "https://github.com/fishfisher/norsk-tipping-cli"
  version "1.0.5"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/fishfisher/norsk-tipping-cli/releases/download/v1.0.5/norsk-tipping-darwin-arm64",
        using: GitHubPrivateRepositoryReleaseDownloadStrategy
    sha256 "1175cdab1d78afa279992a5b0e6c9d5671f6825e0c8b69a25ca80d5757a8ad7e"
  end

  on_intel do
    url "https://github.com/fishfisher/norsk-tipping-cli/releases/download/v1.0.5/norsk-tipping-darwin-amd64",
        using: GitHubPrivateRepositoryReleaseDownloadStrategy
    sha256 "1af49624244d2390ddba5e0a3c74e8fac30e502c93adf2603639d5690570e71c"
  end

  def install
    bin.install Dir["norsk-tipping*"].first => "norsk-tipping"
  end

  test do
    assert_match "Norsk Tipping", shell_output("#{bin}/norsk-tipping --help")
  end
end
