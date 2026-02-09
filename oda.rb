class Oda < Formula
  desc "CLI for ordering groceries from Oda.com"
  homepage "https://github.com/fishfisher/oda-cli"
  version "1.0.0"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/fishfisher/oda-cli/releases/download/v1.0.0/oda-darwin-arm64"
    sha256 "6303cdda0a3229863b290e5a0e03654f604703c5def0641d1dd686a9dca10a3c"
  end

  on_intel do
    url "https://github.com/fishfisher/oda-cli/releases/download/v1.0.0/oda-darwin-amd64"
    sha256 "791adb189dbf4bdbf4afead05ba63bf54cc5022e2c61b5d84e341117a745f246"
  end

  def install
    bin.install Dir["oda*"].first => "oda"
  end

  test do
    assert_match "Oda", shell_output("#{bin}/oda --help")
  end
end
