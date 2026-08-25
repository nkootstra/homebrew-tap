class Cue < Formula
  desc "Turn video and audio files into transcripts, subtitles, and descriptions"
  homepage "https://github.com/nkootstra/cue"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nkootstra/cue/releases/download/v0.3.0/cue-aarch64-apple-darwin.tar.gz"
      sha256 "4841db99647389c6f281be7e5c83868afa1fb773907f418784b56c69741615b6"
    else
      url "https://github.com/nkootstra/cue/releases/download/v0.3.0/cue-x86_64-apple-darwin.tar.gz"
      sha256 "93622094b9b852684cff05897a714205cc093f0707cd5a0d0635715608bb5448"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/nkootstra/cue/releases/download/v0.3.0/cue-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d92c74e8459a5ca056d25ee03c576b046b2d4ea4b69ad848e5959e079cf8e64a"
    else
      url "https://github.com/nkootstra/cue/releases/download/v0.3.0/cue-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "06096f9f6ada32e15efca971bd7fe6e98a7f2c1a393d21b4d8f3f475e29a507c"
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
    assert_equal "cue #0.3.0", shell_output("#{bin}/cue --version").strip
  end
end
