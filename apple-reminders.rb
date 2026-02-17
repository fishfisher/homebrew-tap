require_relative "lib/private_strategy"

class AppleReminders < Formula
  desc "CLI for managing Apple Reminders from the terminal"
  homepage "https://github.com/fishfisher/apple-reminders"
  version "1.1.0"
  license "MIT"

  depends_on :macos
  depends_on arch: :arm64

  url "https://github.com/fishfisher/remindctl/releases/download/v1.1.0/apple-reminders-macos.zip",
      using: FishfisherPrivateReleaseDownloadStrategy
  sha256 "fbc0d4e80aa3421bf637864450350350b4e3ca11e56390be0ee99f9681fb5b8c"

  def install
    bin.install "apple-reminders"
  end

  def post_install
    ohai "Run 'apple-reminders authorize' to grant Reminders access"
    ohai "Run 'apple-reminders install-skill' to install the AI coding skill"
  end

  test do
    assert_match "apple-reminders", shell_output("#{bin}/apple-reminders --help")
  end
end