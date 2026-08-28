class Cue < Formula
  desc "Turn video and audio files into transcripts, subtitles, and descriptions"
  homepage "https://github.com/nkootstra/cue"
  version "0.8.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nkootstra/cue/releases/download/v0.8.0/cue-aarch64-apple-darwin.tar.gz"
      sha256 "c95a2d6fccb5093e620c2b57f66e757411b6645a9dc3051f8d510914fc78f488"
    else
      url "https://github.com/nkootstra/cue/releases/download/v0.8.0/cue-x86_64-apple-darwin.tar.gz"
      sha256 "333f926ffe9a9f2c2f7e7006f5f5b4c59177ee09ca4852565f8a525cabac82dd"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/nkootstra/cue/releases/download/v0.8.0/cue-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e7c225de786bc06bcd666d92aee8c31211ebeebecc34ef9a8332a6213a63dc7e"
    else
      url "https://github.com/nkootstra/cue/releases/download/v0.8.0/cue-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7f066f90d78571497e83bc9ddb54c0bf5b198d30afe3b4d16af97a67738b214c"
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
    assert_equal "cue #0.8.0", shell_output("#{bin}/cue --version").strip
  end
end
