class GhostyRec < Formula
  desc "Record a single macOS window and edit it with agent-directed zooms"
  homepage "https://github.com/blissito/ghosty-rec"
  url "https://github.com/blissito/ghosty-rec/archive/refs/tags/v0.6.2.tar.gz"
  sha256 "41307b6b7a5ba1d6dd652b1241ea711d258690823ad887651f503604701aeeca"
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
