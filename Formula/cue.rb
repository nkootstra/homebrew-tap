class Cue < Formula
  desc "Turn video and audio files into transcripts, subtitles, and descriptions"
  homepage "https://github.com/nkootstra/cue"
  version "0.14.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nkootstra/cue/releases/download/v0.14.0/cue-aarch64-apple-darwin.tar.gz"
      sha256 "7dcdc0cbfe5c2bae7bd7093e091dfa7c4e37891d0d16d8931cf8f294d5f6908a"
    else
      url "https://github.com/nkootstra/cue/releases/download/v0.14.0/cue-x86_64-apple-darwin.tar.gz"
      sha256 "0617fd20a94a0b2c1621b6c65f299b59a7f5f9458cbb58044aaa8c84f295552c"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/nkootstra/cue/releases/download/v0.14.0/cue-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1b80755d0383bd530f60a3d727306032740e61eb6978f79ff90cb75506a4ec49"
    else
      url "https://github.com/nkootstra/cue/releases/download/v0.14.0/cue-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e1ba71f7409c46a0fa7df29b042286baa6f57a6598ca8e4220b03c33a0b7ca2b"
    end
  end

  def install
    bin.install "cue"
  end

  def caveats
    <<~EOS
      Runtime dependencies:
        FFmpeg is required (brew install ffmpeg).
        Python 3.10+ is auto-provisioned by `cue doctor --fix`.
        Ollama is optional, for S1 transcript cleanup.
      Run `cue doctor` to check your environment.
    EOS
  end

  test do
    assert_equal "cue #0.14.0", shell_output("#{bin}/cue --version").strip
  end
end
