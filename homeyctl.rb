require_relative "lib/private_strategy"

class Homeyctl < Formula
  desc "CLI for controlling Homey smart home"
  homepage "https://github.com/fishfisher/homeyctl"
  version "1.2.1"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/fishfisher/homeyctl/releases/download/v1.2.1/homeyctl-darwin-arm64", using: FishfisherPrivateReleaseDownloadStrategy
    sha256 "53ccc8fa1935edfd6300942484037977f4da607a582eb9473ce73721d873d84e"
  else
    url "https://github.com/fishfisher/homeyctl/releases/download/v1.2.1/homeyctl-darwin-amd64", using: FishfisherPrivateReleaseDownloadStrategy
    sha256 "0446f808a95889c9b092508275be431c3026850cd80607b2098669291f33662d"
  end

  def install
    bin.install Dir["homeyctl*"].first => "homeyctl"
  end

  test do
    assert_match "homeyctl", shell_output("#{bin}/homeyctl version")
  end
end
