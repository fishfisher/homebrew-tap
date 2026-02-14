require_relative "lib/private_strategy"
class AppleCalendar < Formula
  desc "CLI for managing Apple Calendar events from the command line"
  homepage "https://github.com/fishfisher/apple-calendar-cli"
  version "2.0.0"
  license "MIT"

  depends_on :macos
  depends_on "node"

  url "https://github.com/fishfisher/apple-calendar-cli/releases/download/v2.0.0/fishfisher-apple-calendar-2.0.0.tgz", using: FishfisherPrivateReleaseDownloadStrategy
  sha256 "7a6e907a30efe4560caaf5e49f8746fd0fccb80afa7c9eab0236e5b839b6e03d"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "apple-calendar", shell_output("#{bin}/apple-calendar --help")
  end
end