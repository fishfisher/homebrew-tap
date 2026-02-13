class AppleContacts < Formula
  desc "CLI for searching and querying Apple Contacts using native Contacts Framework"
  homepage "https://github.com/fishfisher/apple-contacts"
  version "0.3.1"
  license "MIT"

  depends_on :macos
  depends_on arch: :arm64

  url "https://github.com/fishfisher/apple-contacts/releases/download/v0.3.1/apple-contacts-darwin-arm64.zip"
  sha256 "d673f3f934c950b821220d07a11d38d35f83a4c11927adeb83487c6323527be2"

  def install
    bin.install "apple-contacts"
  end

  test do
    assert_match "CLI tool to search and query Apple Contacts", shell_output("#{bin}/apple-contacts --help")
  end
end
