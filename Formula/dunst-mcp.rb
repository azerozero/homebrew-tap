class DunstMcp < Formula
  desc "macOS GUI automation MCP server (Accessibility, OCR, vision)"
  homepage "https://github.com/azerozero/dunst"
  version "0.1.0"
  license "Apache-2.0"
  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/azerozero/dunst/releases/download/v#{version}/dunst-mcp-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "b037ea6781c95d5d96c6a8ff772a61ecfad1204e19fae788772dd07831a6bdf1"
    else
      url "https://github.com/azerozero/dunst/releases/download/v#{version}/dunst-mcp-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "68998f773352f17e1f45063366d4905932f1960e058af5c180b1143e0ec31deb"
    end
  end

  def install
    bin.install "dunst-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dunst-mcp --version")
  end
end
