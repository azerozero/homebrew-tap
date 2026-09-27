class Grob < Formula
  desc "High-performance LLM routing proxy with built-in DLP"
  homepage "https://github.com/azerozero/grob"
  version "0.36.119"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/azerozero/grob/releases/download/v#{version}/grob-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "ca3838c6b39cade808950c48d00e624b31b9564b49f0f0291d265c377ba5680f"
    else
      url "https://github.com/azerozero/grob/releases/download/v#{version}/grob-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "ed813d5f1f85fdd1fa22cf039fd9b312144e7409d42ca0cd3a002e97da40cb94"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/azerozero/grob/releases/download/v#{version}/grob-v#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "f19e6f6c07c2976ef623cfb89d43c6b519d107ce8ef6e1f40b40e8091b5b4ce3"
    else
      url "https://github.com/azerozero/grob/releases/download/v#{version}/grob-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "5c3f998b5ecd7dcb85db4512c0b6a78f568c54e722745d9d348a31b98fa1fd7a"
    end
  end

  def install
    bin.install "grob"
  end

  test do
    assert_match "grob #{version}", shell_output("#{bin}/grob --version")
  end
end
