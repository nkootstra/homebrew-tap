class Cue < Formula
  desc "Turn video and audio files into transcripts, subtitles, and descriptions"
  homepage "https://github.com/nkootstra/cue"
  version "0.12.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nkootstra/cue/releases/download/v0.12.0/cue-aarch64-apple-darwin.tar.gz"
      sha256 "d649a727c8678127b0ad011cecdf2477176d08e268cfcbcf7020e94b7ab7c4bf"
    else
      url "https://github.com/nkootstra/cue/releases/download/v0.12.0/cue-x86_64-apple-darwin.tar.gz"
      sha256 "6f0d39dbf5e06b47c8005c636a03eaae397d4ded413dcb5279d8b13889168d58"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/nkootstra/cue/releases/download/v0.12.0/cue-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2927d7d19aaf59628d03e20fa2c9aab0b7a7338680c51fa82887c319b5534c59"
    else
      url "https://github.com/nkootstra/cue/releases/download/v0.12.0/cue-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "40dfed88e85d00670f9e9123ada00508b90102f848bb0025c71938c60b8e5da1"
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
    assert_equal "cue 0.12.0", shell_output("#{bin}/cue --version").strip
  end
end
