class AppleContacts < Formula
  desc "CLI for searching and querying Apple Contacts using native Contacts Framework"
  homepage "https://github.com/fishfisher/apple-contacts"
  version "0.2.0"
  license "MIT"

  depends_on :macos
  depends_on arch: :arm64

  url "https://github.com/fishfisher/apple-contacts/releases/download/v0.2.0/apple-contacts-darwin-arm64.tar.gz"
  sha256 "1eee183558108b11843e9e0e5053137a2519dab94f44846b0aa5b345cb3b4be4"

  def install
    bin.install "apple-contacts"
  end

  test do
    assert_match "CLI tool to search and query Apple Contacts", shell_output("#{bin}/apple-contacts --help")
  end
end
