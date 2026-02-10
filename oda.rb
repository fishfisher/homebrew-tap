require_relative "lib/private_strategy"

class Oda < Formula
  desc "CLI for ordering groceries from Oda.com"
  homepage "https://github.com/fishfisher/oda-cli"
  version "1.1.0"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/fishfisher/oda-cli/releases/download/v1.1.0/oda-darwin-arm64",
        using: GitHubPrivateRepositoryReleaseDownloadStrategy
    sha256 "22ea3c227dce8d28ec3dce379c83a539e080acbe763d1dd72316874c1839187f"
  end

  on_intel do
    url "https://github.com/fishfisher/oda-cli/releases/download/v1.1.0/oda-darwin-amd64",
        using: GitHubPrivateRepositoryReleaseDownloadStrategy
    sha256 "0dd86460a3e117bb1e7efc3da016481466e91b4b6195af7c9b97a4d50dbdf0c8"
  end

  def install
    bin.install Dir["oda*"].first => "oda"
  end

  test do
    assert_match "Oda", shell_output("#{bin}/oda --help")
  end
end
