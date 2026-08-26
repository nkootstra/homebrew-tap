class Cue < Formula
  desc "Turn video and audio files into transcripts, subtitles, and descriptions"
  homepage "https://github.com/nkootstra/cue"
  version "0.6.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nkootstra/cue/releases/download/v0.6.1/cue-aarch64-apple-darwin.tar.gz"
      sha256 "705db4b3add34ed90bf62879ff7d2d1d1e9c05a101fe3c9e80dc30f0590311eb"
    else
      url "https://github.com/nkootstra/cue/releases/download/v0.6.1/cue-x86_64-apple-darwin.tar.gz"
      sha256 "29ad8e488f3c831b3535a327213a774259c41705b40e2ec6a346aeeb2fa95f3f"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/nkootstra/cue/releases/download/v0.6.1/cue-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e7698ea5e339e3c4d096f65fdf814400b473bdb33c16052404a8654ec1ad858d"
    else
      url "https://github.com/nkootstra/cue/releases/download/v0.6.1/cue-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b5c8d6f1284f6756d2ed30307ca5c1c339980e9e31dd5366cbc16d993d4235da"
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
    assert_equal "cue 0.6.1", shell_output("#{bin}/cue --version").strip
  end
end
