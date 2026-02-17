# typed: false
# frozen_string_literal: true

require_relative "lib/private_strategy"
class Homeyctl < Formula
  desc "CLI for controlling Homey smart home devices"
  homepage "https://github.com/fishfisher/homeyctl"
  version "1.2.0"
  depends_on :macos

  if Hardware::CPU.intel?
    url "https://github.com/fishfisher/homeyctl/releases/download/v1.2.0/homeyctl-darwin-amd64", using: FishfisherPrivateReleaseDownloadStrategy
    sha256 "9cb04744c83413603619f282b8d2cfda105fad2035db4081c5e5445303592acf"

    def install
      bin.install Dir["homeyctl*"].first => "homeyctl"
    end
  end
  if Hardware::CPU.arm?
    url "https://github.com/fishfisher/homeyctl/releases/download/v1.2.0/homeyctl-darwin-arm64", using: FishfisherPrivateReleaseDownloadStrategy
    sha256 "8bdd2d693101b87241039748fc498c29059274c4984f6e282506d45fe41cea67"

    def install
      bin.install Dir["homeyctl*"].first => "homeyctl"
    end
  end

  test do
    assert_match "homeyctl", shell_output("#{bin}/homeyctl version")
  end
end
