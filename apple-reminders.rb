require_relative "lib/private_strategy"

class AppleReminders < Formula
  desc "CLI for managing Apple Reminders from the terminal"
  homepage "https://github.com/fishfisher/apple-reminders"
  version "0.3.2"
  license "MIT"

  depends_on :macos
  depends_on arch: :arm64

  url "https://github.com/fishfisher/remindctl/releases/download/v0.3.2/apple-reminders-macos.zip",
      using: FishfisherPrivateReleaseDownloadStrategy
  sha256 "c9d3dea6a0c5e6cc50e67245f72100da1ec5de04849f4c4bc7fd250b5c2f560c"

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
