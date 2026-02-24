require_relative "lib/private_strategy"
class AppleCalendar < Formula
  desc "CLI for managing Apple Calendar events from the command line"
  homepage "https://github.com/fishfisher/apple-calendar-cli"
  version "2.1.1"
  license "MIT"

  depends_on :macos
  depends_on "node"

  url "https://github.com/fishfisher/apple-calendar-cli/releases/download/v2.1.1/fishfisher-apple-calendar-2.1.1.tgz", using: FishfisherPrivateReleaseDownloadStrategy
  sha256 "9cfee3b17267174cd617157fa40271bfdf182efb82d82035a37ab472eef5acf5"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "apple-calendar", shell_output("#{bin}/apple-calendar --help")
  end
end
