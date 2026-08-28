class Cue < Formula
  desc "Turn video and audio files into transcripts, subtitles, and descriptions"
  homepage "https://github.com/nkootstra/cue"
  version "0.9.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nkootstra/cue/releases/download/v0.9.0/cue-aarch64-apple-darwin.tar.gz"
      sha256 "595f70282f9229c62f695da143471010d5e07c7ab2b1ec385b4e6fc004c5e319"
    else
      url "https://github.com/nkootstra/cue/releases/download/v0.9.0/cue-x86_64-apple-darwin.tar.gz"
      sha256 "fa1de3a9adfaaef378df2967a4e3cf07c32f5f14c10b11cca21b273fae8de018"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/nkootstra/cue/releases/download/v0.9.0/cue-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "15c84a223dea3d8eddc5bcaa16676535ac6af39653eae83facb5ade9a9928e83"
    else
      url "https://github.com/nkootstra/cue/releases/download/v0.9.0/cue-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "12213a14a679c801285449d51d23f6efef0653efeec8c07dfcc94d9ab6e4e3be"
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
    assert_equal "cue 0.9.0", shell_output("#{bin}/cue --version").strip
  end
end
