require_relative "lib/private_strategy"

class NorskTipping < Formula
  desc "CLI for buying lottery tickets from Norsk Tipping"
  homepage "https://github.com/fishfisher/norsk-tipping-cli"
  version "1.0.0"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/fishfisher/norsk-tipping-cli/releases/download/v1.0.0/norsk-tipping-darwin-arm64",
        using: GitHubPrivateRepositoryReleaseDownloadStrategy
    sha256 "f4d7a059b78f2b10792b7492ab871888435c516b33e4baec6c0a2ce6a4c05df9"
  end

  on_intel do
    url "https://github.com/fishfisher/norsk-tipping-cli/releases/download/v1.0.0/norsk-tipping-darwin-amd64",
        using: GitHubPrivateRepositoryReleaseDownloadStrategy
    sha256 "8faab4aecac534a7868bd9f467f5c87d2493eb6ea098161c6dff99cdfb3659f6"
  end

  def install
    bin.install Dir["norsk-tipping*"].first => "norsk-tipping"
  end

  test do
    assert_match "Norsk Tipping", shell_output("#{bin}/norsk-tipping --help")
  end
end
