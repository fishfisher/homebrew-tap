class NorskTipping < Formula
  desc "CLI for buying lottery tickets from Norsk Tipping"
  homepage "https://github.com/fishfisher/norsk-tipping-cli"
  version "1.0.2"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/fishfisher/norsk-tipping-cli/releases/download/v1.0.2/norsk-tipping-darwin-arm64"
    sha256 "eb3ebb70460eb69c2c870c869958d544c83c58e5c70df07f96ec07200fe31f6d"
  end

  on_intel do
    url "https://github.com/fishfisher/norsk-tipping-cli/releases/download/v1.0.2/norsk-tipping-darwin-amd64"
    sha256 "cbfe82585550c8711dfd760a998aca0aa578743ff7fbcedeb136b1c3bdc97fb3"
  end

  def install
    bin.install Dir["norsk-tipping*"].first => "norsk-tipping"
  end

  test do
    assert_match "Norsk Tipping", shell_output("#{bin}/norsk-tipping --help")
  end
end
