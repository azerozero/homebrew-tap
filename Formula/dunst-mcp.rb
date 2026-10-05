class DunstMcp < Formula
  desc "macOS GUI automation MCP server (Accessibility, OCR, vision)"
  homepage "https://github.com/azerozero/dunst"
  version "0.1.3"
  license "Apache-2.0"
  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/azerozero/dunst/releases/download/v#{version}/dunst-mcp-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "59f29fd63570f136eaef9cde0be07ab0511c7b7aa68db92349aec3e6413c1b88"
    else
      url "https://github.com/azerozero/dunst/releases/download/v#{version}/dunst-mcp-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "da595ee537704febdd8843ed20445952d3d06590e0f02ed298d7b8d50286496c"
    end
  end

  def install
    bin.install "dunst-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dunst-mcp --version")
  end
end
