require_relative "lib/private_strategy"

class NorskTipping < Formula
  desc "CLI for buying lottery tickets from Norsk Tipping"
  homepage "https://github.com/fishfisher/norsk-tipping-cli"
  version "1.0.7"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/fishfisher/norsk-tipping-cli/releases/download/v1.0.7/norsk-tipping-darwin-arm64",
        using: FishfisherPrivateReleaseDownloadStrategy
    sha256 "168d0a6fe2927039638f1d1dc9fa335b800b913aef317cf488fa660eaf79d338"
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
