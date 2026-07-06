class DunstMcp < Formula
  desc "macOS GUI automation MCP server (Accessibility, OCR, vision)"
  homepage "https://github.com/azerozero/dunst"
  version "0.1.0"
  license "Apache-2.0"
  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/azerozero/dunst/releases/download/v#{version}/dunst-mcp-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "307ef1292a75157cc53143e68035672619fa5c9036062b6e9dce0577b4ebea55"
    else
      url "https://github.com/azerozero/dunst/releases/download/v#{version}/dunst-mcp-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "3a6f45b632dd9fe8c34ae7d9bc5a66703201627498b2e6eceb433a86d284e155"
    end
  end

  def install
    bin.install "dunst-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dunst-mcp --version")
  end
end
