require_relative "lib/private_strategy"

class Homeyctl < Formula
  desc "CLI for controlling Homey smart home"
  homepage "https://github.com/fishfisher/homeyctl"
  version "1.3.0"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/fishfisher/homeyctl/releases/download/v1.3.0/homeyctl-darwin-arm64", using: FishfisherPrivateReleaseDownloadStrategy
    sha256 "f27d432da40d3a57155a2d280ce464b953495723f1cb575a3c7421a2be19af7c"
  else
    url "https://github.com/fishfisher/homeyctl/releases/download/v1.3.0/homeyctl-darwin-amd64", using: FishfisherPrivateReleaseDownloadStrategy
    sha256 "4a21dc9ccb5618ec2eafe49183655d6f0f8ab23b7e83be51a95c5f95773ffde3"
  end

  def install
    bin.install Dir["homeyctl*"].first => "homeyctl"
  end

  test do
    assert_match "homeyctl", shell_output("#{bin}/homeyctl version")
  end
end
