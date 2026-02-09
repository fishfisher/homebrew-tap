require_relative "lib/private_strategy"

class NorskTipping < Formula
  desc "CLI for buying lottery tickets from Norsk Tipping"
  homepage "https://github.com/fishfisher/norsk-tipping-cli"
  version "1.0.4"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/fishfisher/norsk-tipping-cli/releases/download/v1.0.4/norsk-tipping-darwin-arm64",
        using: GitHubPrivateRepositoryReleaseDownloadStrategy
    sha256 "3a1c42018596358f14ac38c73569b8ad2a35e8d2b5e79ee0ecdab85af29346ea"
  end

  on_intel do
    url "https://github.com/fishfisher/norsk-tipping-cli/releases/download/v1.0.4/norsk-tipping-darwin-amd64",
        using: GitHubPrivateRepositoryReleaseDownloadStrategy
    sha256 "e49b8e13290eacdbcbae9a24ec2a93586f659d50424ef06651ab98c9a6336283"
  end

  def install
    bin.install Dir["norsk-tipping*"].first => "norsk-tipping"
  end

  test do
    assert_match "Norsk Tipping", shell_output("#{bin}/norsk-tipping --help")
  end
end
