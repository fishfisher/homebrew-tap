class NorskTipping < Formula
  desc "CLI for buying lottery tickets from Norsk Tipping"
  homepage "https://github.com/fishfisher/norsk-tipping-cli"
  version "1.0.1"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/fishfisher/norsk-tipping-cli/releases/download/v1.0.1/norsk-tipping-darwin-arm64"
    sha256 "9346d8be70378cebbda2b61b264f32667f7c1a36743bb35df41fdf079105fef3"
  end

  on_intel do
    url "https://github.com/fishfisher/norsk-tipping-cli/releases/download/v1.0.1/norsk-tipping-darwin-amd64"
    sha256 "68ce904f6b5c70639992a6c40ff3bfeb3287b7d459768aee2fb2232c1d0d24e3"
  end

  def install
    bin.install Dir["norsk-tipping*"].first => "norsk-tipping"
  end

  test do
    assert_match "Norsk Tipping", shell_output("#{bin}/norsk-tipping --help")
  end
end
