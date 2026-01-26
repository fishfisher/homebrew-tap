class AppleContacts < Formula
  desc "CLI for searching and querying Apple Contacts using native Contacts Framework"
  homepage "https://github.com/fishfisher/apple-contacts"
  version "0.2.1"
  license "MIT"

  depends_on :macos
  depends_on arch: :arm64

  url "https://github.com/fishfisher/apple-contacts/releases/download/v0.2.1/apple-contacts-darwin-arm64.tar.gz"
  sha256 "25bd824636b03edfb4a5440b37c8dbef96480d127db0b1e6b4c305f3a492b081"

  def install
    bin.install "apple-contacts"
  end

  test do
    assert_match "CLI tool to search and query Apple Contacts", shell_output("#{bin}/apple-contacts --help")
  end
end
