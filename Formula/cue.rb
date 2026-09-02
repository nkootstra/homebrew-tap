class Cue < Formula
  desc "Turn video and audio files into transcripts, subtitles, and descriptions"
  homepage "https://github.com/nkootstra/cue"
  version "0.15.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nkootstra/cue/releases/download/v0.15.1/cue-aarch64-apple-darwin.tar.gz"
      sha256 "1622d442166ccb19bb9908e9dd14be6a4ae32bcd431cf9cfc1eacebe15e2248b"
    else
      url "https://github.com/nkootstra/cue/releases/download/v0.15.1/cue-x86_64-apple-darwin.tar.gz"
      sha256 "6d717ad62fa154d39dbd7a882189727b0a1e744261c258a484eb23613ba7c2bd"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/nkootstra/cue/releases/download/v0.15.1/cue-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d13e3e2cce1407000f1b42c07a811fa818dd4e159dd28024f9d6eb6964ab0a5f"
    else
      url "https://github.com/nkootstra/cue/releases/download/v0.15.1/cue-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "699f9dbb338edd39c8aec456c625cc78d176b6b35ad2118dd9669de7cd68d4f1"
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
    assert_equal "cue 0.15.1", shell_output("#{bin}/cue --version").strip
  end
end
