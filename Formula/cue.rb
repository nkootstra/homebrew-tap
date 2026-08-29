class Cue < Formula
  desc "Turn video and audio files into transcripts, subtitles, and descriptions"
  homepage "https://github.com/nkootstra/cue"
  version "0.11.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nkootstra/cue/releases/download/v0.11.0/cue-aarch64-apple-darwin.tar.gz"
      sha256 "ad9bf4f2f6999f9d376947ff097ed6b03390cff37d7a121bdcd248d110c30b04"
    else
      url "https://github.com/nkootstra/cue/releases/download/v0.11.0/cue-x86_64-apple-darwin.tar.gz"
      sha256 "5d81253fab88bb93bbe55ac6e8b91deb9371729c269ecd623f875ddceadbc93b"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/nkootstra/cue/releases/download/v0.11.0/cue-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7cdfaa4a546596bc1a966574a796174283139c16ea30080a8bb228e7422fbff5"
    else
      url "https://github.com/nkootstra/cue/releases/download/v0.11.0/cue-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3293270510ad48fdddfe878e7eee49490cd680ee7816e6441830330710919ac6"
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
    assert_equal "cue 0.11.0", shell_output("#{bin}/cue --version").strip
  end
end
