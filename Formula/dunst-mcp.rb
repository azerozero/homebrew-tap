class DunstMcp < Formula
  desc "macOS GUI automation MCP server (Accessibility, OCR, vision)"
  homepage "https://github.com/azerozero/dunst"
  version "0.1.1"
  license "Apache-2.0"
  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/azerozero/dunst/releases/download/v#{version}/dunst-mcp-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "b7cd28ee0501bbb41491f7d12a41345571a9ed4fb6948b26c3f824f7bf649b0e"
    else
      url "https://github.com/azerozero/dunst/releases/download/v#{version}/dunst-mcp-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "bda1349f804b89585ae3efa50bc316ad718e7bf28e60f1aa5901cfe0af6ca16e"
    end
  end

  def install
    bin.install "dunst-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dunst-mcp --version")
  end
end
