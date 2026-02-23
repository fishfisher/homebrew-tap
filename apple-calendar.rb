require_relative "lib/private_strategy"
class AppleCalendar < Formula
  desc "CLI for managing Apple Calendar events from the command line"
  homepage "https://github.com/fishfisher/apple-calendar-cli"
  version "2.0.1"
  license "MIT"

  depends_on :macos
  depends_on "node"

  url "https://github.com/fishfisher/apple-calendar-cli/releases/download/v2.0.1/fishfisher-apple-calendar-2.0.1.tgz", using: FishfisherPrivateReleaseDownloadStrategy
  sha256 "4b326cbcd149ea85c5c909459fad5d87bdc79ce69460f57c11a97e2e51963c58"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "apple-calendar", shell_output("#{bin}/apple-calendar --help")
  end
end
