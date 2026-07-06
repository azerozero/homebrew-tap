class DunstMcp < Formula
  desc "macOS GUI automation MCP server (Accessibility, OCR, vision)"
  homepage "https://github.com/azerozero/dunst"
  version "0.1.2"
  license "Apache-2.0"
  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/azerozero/dunst/releases/download/v#{version}/dunst-mcp-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "4d4d729539c6beb5011f4dc0b2c4beb4e2242d5be09917233cd61afe58b17136"
    else
      url "https://github.com/azerozero/dunst/releases/download/v#{version}/dunst-mcp-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "174fa6e162a524f8c21ff8048381b346ea7a66d90603d8ef586c96ed98e25aba"
    end
  end

  def install
    bin.install "dunst-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dunst-mcp --version")
  end
end
