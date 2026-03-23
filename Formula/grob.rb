class Grob < Formula
  desc "High-performance LLM routing proxy with built-in DLP"
  homepage "https://github.com/azerozero/grob"
  version "0.29.1"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/azerozero/grob/releases/download/v#{version}/grob-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "6d99d7d097b9159c0b9edcad2ef5293e3111b26c47ed7c0e3aafb3916b7bc5b8"
    else
      url "https://github.com/azerozero/grob/releases/download/v#{version}/grob-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "64b24a2a55d1d8b0f7b05c8e68c470bdd39c061fcce43799286091fd293e9b2c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/azerozero/grob/releases/download/v#{version}/grob-v#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "51ab8cc2ca74a053f482a55f1251a069a51165635ca3833de9e8fe49d7520195"
    else
      url "https://github.com/azerozero/grob/releases/download/v#{version}/grob-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "55d26bee069e78d68f457d1ddc4851b8da9f4a941b1324f450813ce2b34e18c8"
    end
  end

  def install
    bin.install "grob"
  end

  test do
    assert_match "grob #{version}", shell_output("#{bin}/grob --version")
  end
end
