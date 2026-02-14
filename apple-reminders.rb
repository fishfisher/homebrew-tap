require_relative "lib/private_strategy"

class AppleReminders < Formula
  desc "CLI for managing Apple Reminders from the terminal"
  homepage "https://github.com/fishfisher/apple-reminders"
  version "1.0.0"
  license "MIT"

  depends_on :macos
  depends_on arch: :arm64

  url "https://github.com/fishfisher/remindctl/releases/download/v1.0.0/apple-reminders-macos.zip",
      using: FishfisherPrivateReleaseDownloadStrategy
  sha256 "0f98755ffd960c9adbdfdc354b2125788b029ef45021c30b82bc7759586b78f7"

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