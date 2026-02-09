require_relative "lib/private_strategy"

class Oda < Formula
  desc "CLI for ordering groceries from Oda.com"
  homepage "https://github.com/fishfisher/oda-cli"
  version "1.0.3"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/fishfisher/oda-cli/releases/download/v1.0.3/oda-darwin-arm64",
        using: GitHubPrivateRepositoryReleaseDownloadStrategy
    sha256 "257351637ad9537e21433063897a68fb65c7e2cc8768f6e221d08365ca057b18"
  end

  on_intel do
    url "https://github.com/fishfisher/oda-cli/releases/download/v1.0.3/oda-darwin-amd64",
        using: GitHubPrivateRepositoryReleaseDownloadStrategy
    sha256 "563a0f21e0b7628814a645c8879e07a99d8df1cb67d4831875493cc258b829e7"
  end

  def install
    bin.install Dir["oda*"].first => "oda"
  end

  test do
    assert_match "Oda", shell_output("#{bin}/oda --help")
  end
end
