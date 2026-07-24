class Grob < Formula
  desc "High-performance LLM routing proxy with built-in DLP"
  homepage "https://github.com/azerozero/grob"
  version "0.36.78"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/azerozero/grob/releases/download/v#{version}/grob-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "ed211d0143d8af4c3548d1e5472fdd52f4d92afcf4f853c60127b65b26c3df77"
    else
      url "https://github.com/azerozero/grob/releases/download/v#{version}/grob-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "7851a1ef43195ce76cf451b6b80ac0b9b4f1a91abf60fc01cdbb8e7a5d013937"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/azerozero/grob/releases/download/v#{version}/grob-v#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "e8bf0d31ad24e63bc6fc20f922110d07f5a6d35fd3f0d6ea19fc981b28d60389"
    else
      url "https://github.com/azerozero/grob/releases/download/v#{version}/grob-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "159ebd99a4984c448c1f8dbe531b042ae97a5a912d6c14fbdc344075317442b4"
    end
  end

  def install
    bin.install "grob"
  end

  test do
    assert_match "grob #{version}", shell_output("#{bin}/grob --version")
  end
end
