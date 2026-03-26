class Grob < Formula
  desc "High-performance LLM routing proxy with built-in DLP"
  homepage "https://github.com/azerozero/grob"
  version "0.29.7"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/azerozero/grob/releases/download/v#{version}/grob-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "289f66fe0cc843c74ca50daa89c109d46d68e251f3f41a7649f5e35b9138869b"
    else
      url "https://github.com/azerozero/grob/releases/download/v#{version}/grob-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "ce2a7b3f557dc71cf3f7286b3606291f859bd8e7d6264f7efdc2dd6ed8ffde5d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/azerozero/grob/releases/download/v#{version}/grob-v#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "2a9ebfc0a1efc06561ed7aa1c959e488e2cf7c6daf66ce96287b9d326126c2fd"
    else
      url "https://github.com/azerozero/grob/releases/download/v#{version}/grob-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "323ca5cca309d2d067d2762f2e53abb2a524d2e4d3a0a76b10253e3fed6e9cd3"
    end
  end

  def install
    bin.install "grob"
  end

  test do
    assert_match "grob #{version}", shell_output("#{bin}/grob --version")
  end
end
