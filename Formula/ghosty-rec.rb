class GhostyRec < Formula
  desc "Record a single macOS window and edit it with agent-directed zooms"
  homepage "https://github.com/blissito/ghosty-rec"
  url "https://github.com/blissito/ghosty-rec/archive/refs/tags/v0.5.2.tar.gz"
  sha256 "cd5bd4ba2b6f5b4120028cc879adb2292742d979123a3dfd67116581c89a66ba"
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
