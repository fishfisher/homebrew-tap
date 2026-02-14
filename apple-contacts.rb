class AppleContacts < Formula
  desc "CLI for searching and querying Apple Contacts using native Contacts Framework"
  homepage "https://github.com/fishfisher/apple-contacts"
  version "0.3.2"
  license "MIT"

  depends_on :macos
  depends_on arch: :arm64

  url "https://github.com/fishfisher/apple-contacts/releases/download/v0.3.2/apple-contacts-darwin-arm64.zip"
  sha256 "3e0e7eb2aa39a6ff0c019321b727181b91a1af1ac28a85d91c9c91eff0315345"

  def install
    bin.install "apple-contacts"
  end

  test do
    assert_match "CLI tool to search and query Apple Contacts", shell_output("#{bin}/apple-contacts --help")
  end
end
