class Saragossa < Formula
  desc "Pure-Rust Metal inference engine for Apple Silicon LLMs, STT and TTS"
  homepage "https://github.com/azerozero/saragossa"
  version "0.3.22"
  url "https://github.com/azerozero/saragossa/releases/download/v#{version}/saragossa-v#{version}-aarch64-apple-darwin.tar.gz"
  sha256 "844cb128ffc1f747cb97a9fe601abffaa07098835728f9246274590c5f64c4e7"
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
