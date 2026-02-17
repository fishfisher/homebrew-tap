require_relative "lib/private_strategy"

class Homeyctl < Formula
  desc "CLI for controlling Homey smart home"
  homepage "https://github.com/fishfisher/homeyctl"
  version "1.2.0"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/fishfisher/homeyctl/releases/download/v1.2.0/homeyctl-darwin-arm64", using: FishfisherPrivateReleaseDownloadStrategy
    sha256 "024df630a7ed8e9b4216a120080881aa6aa8fa6880b17e505239005265c9b847"
  else
    url "https://github.com/fishfisher/homeyctl/releases/download/v1.2.0/homeyctl-darwin-amd64", using: FishfisherPrivateReleaseDownloadStrategy
    sha256 "d691c6a9585311a00e2f8e03c24e7bc599e2c3f25eaca2d527929486363bfb3b"
  end

  def install
    bin.install Dir["homeyctl*"].first => "homeyctl"
  end

  test do
    assert_match "homeyctl", shell_output("#{bin}/homeyctl version")
  end
end
