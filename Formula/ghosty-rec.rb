class GhostyRec < Formula
  desc "Record a single macOS window and edit it with agent-directed zooms"
  homepage "https://github.com/blissito/ghosty-rec"
  url "https://github.com/blissito/ghosty-rec/archive/refs/tags/v0.6.6.tar.gz"
  sha256 "66d94f348a4002226457b10693b06291f7915c73128a8f9b98d6266db135abb5"
  license "MIT"

  depends_on macos: :sequoia

  # sox también instala un comando `rec` (grabar audio).
  conflicts_with "sox", because: "both install a `rec` binary"

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/rec"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rec --version")
  end
end
