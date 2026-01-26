class AppleContacts < Formula
  desc "CLI for searching and querying Apple Contacts using native Contacts Framework"
  homepage "https://github.com/fishfisher/apple-contacts"
  url "https://github.com/fishfisher/apple-contacts/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "3e2c9cc19296b811cd9a1a962e821990767816084badd949655b7336f220128f"
  license "MIT"
  head "https://github.com/fishfisher/apple-contacts.git", branch: "main"

  depends_on :macos
  depends_on xcode: ["15.0", :build]

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/apple-contacts"
  end

  test do
    assert_match "CLI tool to search and query Apple Contacts", shell_output("#{bin}/apple-contacts --help")
  end
end
