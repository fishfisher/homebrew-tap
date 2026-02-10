require_relative "lib/private_strategy"

class AppleReminders < Formula
  desc "CLI for managing Apple Reminders from the terminal"
  homepage "https://github.com/fishfisher/apple-reminders"
  version "0.3.1"
  license "MIT"

  depends_on :macos
  depends_on arch: :arm64

  url "https://github.com/fishfisher/remindctl/releases/download/v0.3.1/apple-reminders-macos.zip",
      using: GitHubPrivateRepositoryReleaseDownloadStrategy
  sha256 "42874983c4950f6b8c55fb745dba28b5098f8f0d5306ae54b24d0c8e7f963ab0"

  def install
    bin.install "apple-reminders"
  end

  def post_install
    ohai "Run 'apple-reminders authorize' to grant Reminders access"
    ohai "Run 'apple-reminders install-skill' to install the Claude Code skill"
  end

  test do
    assert_match "apple-reminders", shell_output("#{bin}/apple-reminders --help")
  end
end
