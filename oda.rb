require_relative "lib/private_strategy"

class Oda < Formula
  desc "CLI for ordering groceries from Oda.com"
  homepage "https://github.com/fishfisher/oda-cli"
  version "1.0.2"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/fishfisher/oda-cli/releases/download/v1.0.2/oda-darwin-arm64",
        using: GitHubPrivateRepositoryReleaseDownloadStrategy
    sha256 "0548286aba81cdc8f9a46989bf27a727fc643b5181a64fa7b591a903b0ce58e4"
  end

  on_intel do
    url "https://github.com/fishfisher/oda-cli/releases/download/v1.0.2/oda-darwin-amd64",
        using: GitHubPrivateRepositoryReleaseDownloadStrategy
    sha256 "42443cf3b96ad8ba41cb9b2234c139a6f44300c7c168db9e11c26240bba6339f"
  end

  def install
    bin.install Dir["oda*"].first => "oda"
  end

  test do
    assert_match "Oda", shell_output("#{bin}/oda --help")
  end
end
