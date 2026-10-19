class GhostyRec < Formula
  desc "Record a single macOS window and edit it with agent-directed zooms"
  homepage "https://github.com/blissito/ghosty-rec"
  url "https://github.com/blissito/ghosty-rec/archive/refs/tags/v0.6.3.tar.gz"
  sha256 "88d5e44763054d7810cfe441315a7edf311f41eb127390b9d5fa98798ba844d0"
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
