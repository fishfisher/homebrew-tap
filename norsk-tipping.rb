require_relative "lib/private_strategy"

class NorskTipping < Formula
  desc "CLI for buying lottery tickets from Norsk Tipping"
  homepage "https://github.com/fishfisher/norsk-tipping-cli"
  version "1.0.6"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/fishfisher/norsk-tipping-cli/releases/download/v1.0.6/norsk-tipping-darwin-arm64",
        using: FishfisherPrivateReleaseDownloadStrategy
    sha256 "34a5686d18bf88aeb6a343007b43fdf6fb820de2724305f56588b7f1463fabb8"
  end

  on_intel do
    url "https://github.com/fishfisher/norsk-tipping-cli/releases/download/v1.0.6/norsk-tipping-darwin-amd64",
        using: FishfisherPrivateReleaseDownloadStrategy
    sha256 "d37ec5ca484cfdad5494481c4e521e2c5f86393a3786ae2687b8b9cbaf9e1907"
  end

  def install
    bin.install Dir["norsk-tipping*"].first => "norsk-tipping"
  end

  test do
    assert_match "Norsk Tipping", shell_output("#{bin}/norsk-tipping --help")
  end
end
