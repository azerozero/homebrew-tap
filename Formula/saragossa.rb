class Saragossa < Formula
  desc "Pure-Rust Metal inference engine for Apple Silicon LLMs, STT and TTS"
  homepage "https://github.com/azerozero/saragossa"
  version "0.3.3"
  url "https://github.com/azerozero/saragossa/releases/download/v#{version}/saragossa-v#{version}-aarch64-apple-darwin.tar.gz"
  sha256 "11e6e2648c297d7cad3fce19c6e2dd73751d83054750772b34f8bdd13b130ae1"
  license "Apache-2.0"

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "saragossa"
    doc.install "README.md", "LICENSE", "NOTICE"
  end

  def caveats
    <<~EOS
      saragossa compile ses kernels Metal au premier lancement
      (MTLDevice newLibraryWithSource). Cela requiert la Metal Toolchain :

        xcodebuild -downloadComponent MetalToolchain

      Les poids de modèle sont résolus depuis Hugging Face au premier run :

        saragossa run mlx-community/Qwen3-4B-4bit
        saragossa list
        saragossa serve --model-dir ~/models --api-key local-dev
    EOS
  end

  test do
    assert_match "saragossa", shell_output("#{bin}/saragossa --help 2>&1")
  end
end
