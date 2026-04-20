class Grob < Formula
  desc "High-performance LLM routing proxy with built-in DLP"
  homepage "https://github.com/azerozero/grob"
  version "0.36.25"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/azerozero/grob/releases/download/v#{version}/grob-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "12712cf5a62879a2158db08b7637515d860be0dd225ebb04e51e86fcd2e76a16"
    else
      url "https://github.com/azerozero/grob/releases/download/v#{version}/grob-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "dc8c3aca451d9d3b2b6c6387331336c54d0b3d20d5f3699eed030951ed1e12be"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/azerozero/grob/releases/download/v#{version}/grob-v#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "b1c54d536512943c20e5674aa5944ccc27ed8130c2d51527cff718e9baccfee1"
    else
      url "https://github.com/azerozero/grob/releases/download/v#{version}/grob-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "daf212ddcd413445ddcd7729b7deaf0c926a8959787a08629fe98b6fce7c0340"
    end
  end

  def install
    bin.install "grob"
  end

  test do
    assert_match "grob #{version}", shell_output("#{bin}/grob --version")
  end
end
