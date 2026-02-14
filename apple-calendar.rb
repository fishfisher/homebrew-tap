require_relative "lib/private_strategy"
class AppleCalendar < Formula
  desc "CLI for managing Apple Calendar events from the command line"
  homepage "https://github.com/fishfisher/apple-calendar-cli"
  version "1.0.0"
  license "MIT"

  depends_on :macos
  depends_on "node"

  url "https://github.com/fishfisher/apple-calendar-cli/releases/download/v1.0.0/fishfisher-apple-calendar-1.0.0.tgz", using: FishfisherPrivateReleaseDownloadStrategy
  sha256 "2f568a4d552c45fb9ce0c57e3343a3bf9ba603389fb61ac9e732ad844ffc5fd5"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "apple-calendar", shell_output("#{bin}/apple-calendar --help")
  end
end
