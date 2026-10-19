class GhostyRec < Formula
  desc "Record a single macOS window and edit it with agent-directed zooms"
  homepage "https://github.com/blissito/ghosty-rec"
  url "https://github.com/blissito/ghosty-rec/archive/refs/tags/v0.6.5.tar.gz"
  sha256 "dabb43949cc9ca56c01dc4af726370545ac000fc792cb5905f945eacdf846f15"
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
