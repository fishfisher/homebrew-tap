class Sonoscli < Formula
  desc "Control Sonos speakers from the command line"
  homepage "https://github.com/fishfisher/sonoscli"
  version "0.2.0"
  license "MIT"

  depends_on :macos
  depends_on arch: :arm64

  url "https://github.com/fishfisher/sonoscli/releases/download/v0.2.0/sonoscli_0.2.0_darwin_arm64.zip"
  sha256 "081bb71ec33c44bd8cce92529555a2df350b1ac9faa6e44d11c2bcf7d2a31537"

  def install
    bin.install "sonos"
  end

  test do
    assert_match "Control Sonos speakers", shell_output("#{bin}/sonos --help")
  end
end
