class AppleContacts < Formula
  desc "CLI for searching and querying Apple Contacts using native Contacts Framework"
  homepage "https://github.com/fishfisher/apple-contacts"
  version "0.3.0"
  license "MIT"

  depends_on :macos
  depends_on arch: :arm64

  url "https://github.com/fishfisher/apple-contacts/releases/download/v0.3.0/apple-contacts-darwin-arm64.tar.gz"
  sha256 "759e1ef17e985e8433a2fac1486130ff6123a47f0d611917a54c603e867f2b82"

  def install
    bin.install "apple-contacts"
  end

  test do
    assert_match "CLI tool to search and query Apple Contacts", shell_output("#{bin}/apple-contacts --help")
  end
end
