require_relative "lib/private_strategy"

class Remindctl < Formula
  desc "CLI for managing Apple Reminders from the terminal"
  homepage "https://github.com/fishfisher/remindctl"
  version "0.2.1"
  license "MIT"

  depends_on :macos
  depends_on arch: :arm64

  url "https://github.com/fishfisher/remindctl/releases/download/v0.2.1/remindctl-macos.zip",
      using: GitHubPrivateRepositoryReleaseDownloadStrategy
  sha256 "e05a44486e31f19d9bcdaab005e4ec05cb099cbd97f3635d3bfb824a645c382a"

  def install
    bin.install "remindctl"
  end

  def post_install
    ohai "Run 'remindctl authorize' to grant Reminders access"
    ohai "Run 'remindctl install-skill' to install the Claude Code skill"
  end

  test do
    assert_match "remindctl", shell_output("#{bin}/remindctl --help")
  end
end
