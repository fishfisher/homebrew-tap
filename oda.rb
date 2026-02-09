class Oda < Formula
  desc "CLI for ordering groceries from Oda.com"
  homepage "https://github.com/fishfisher/oda-cli"
  version "1.0.1"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/fishfisher/oda-cli/releases/download/v1.0.1/oda-darwin-arm64"
    sha256 "d8237105cf593307dc3a6786b3d1e05b92fa5377833eb15676eb225ff9032bc7"
  end

  on_intel do
    url "https://github.com/fishfisher/oda-cli/releases/download/v1.0.1/oda-darwin-amd64"
    sha256 "4b0650df23f3bafa4573620c0f6dd8e4ff923c2bfd6ded820ebda1d3340b4b17"
  end

  def install
    bin.install Dir["oda*"].first => "oda"
  end

  test do
    assert_match "Oda", shell_output("#{bin}/oda --help")
  end
end
