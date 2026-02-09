class NorskTipping < Formula
  desc "CLI for buying lottery tickets from Norsk Tipping"
  homepage "https://github.com/fishfisher/norsk-tipping-cli"
  version "1.0.3"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/fishfisher/norsk-tipping-cli/releases/download/v1.0.3/norsk-tipping-darwin-arm64"
    sha256 "eab195d496df1f037f3a0ae24d33efd42f78f9ff37488c51dbe88f7a0167c220"
  end

  on_intel do
    url "https://github.com/fishfisher/norsk-tipping-cli/releases/download/v1.0.3/norsk-tipping-darwin-amd64"
    sha256 "ad2164ac1786e63f7daeb437c1f6dc640cf5bc8da27e51f00c89150561b24951"
  end

  def install
    bin.install Dir["norsk-tipping*"].first => "norsk-tipping"
  end

  test do
    assert_match "Norsk Tipping", shell_output("#{bin}/norsk-tipping --help")
  end
end
