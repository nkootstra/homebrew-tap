class Cue < Formula
  desc "Turn video and audio files into transcripts, subtitles, and descriptions"
  homepage "https://github.com/nkootstra/cue"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nkootstra/cue/releases/download/v0.1.0/cue-aarch64-apple-darwin.tar.gz"
      sha256 "7c21124bc3553952ad762fd5dacb3c7da1921fa3a256fd62b0579924da4521c5"
    else
      url "https://github.com/nkootstra/cue/releases/download/v0.1.0/cue-x86_64-apple-darwin.tar.gz"
      sha256 "a83ebdae07dcb6e23ee9794748b253944ad4bd6eebe1d8fa4d31ddbfef2997e0"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/nkootstra/cue/releases/download/v0.1.0/cue-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bd5860cdf2456f1c26eb120d2840746a26437b5ae02048537f55f1a47af0ebdf"
    else
      url "https://github.com/nkootstra/cue/releases/download/v0.1.0/cue-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "432db7fb88567f390e001458b1896dd6b6df1a1ed452658982ce7b0e1aca79b1"
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
    assert_equal "cue #0.1.0", shell_output("#{bin}/cue --version").strip
  end
end
