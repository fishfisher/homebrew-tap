require_relative "lib/private_strategy"
class AppleCalendar < Formula
  desc "CLI for managing Apple Calendar events from the command line"
  homepage "https://github.com/fishfisher/apple-calendar-cli"
  version "2.1.0"
  license "MIT"

  depends_on :macos
  depends_on "node"

  url "https://github.com/fishfisher/apple-calendar-cli/releases/download/v2.1.0/fishfisher-apple-calendar-2.1.0.tgz", using: FishfisherPrivateReleaseDownloadStrategy
  sha256 "07b316195a8aee17a5d0e0b3d69a9c56214b71332bc3f1d72de261a6ce7b06cb"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "apple-calendar", shell_output("#{bin}/apple-calendar --help")
  end
end
