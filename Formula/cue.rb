class Cue < Formula
  desc "Turn video and audio files into transcripts, subtitles, and descriptions"
  homepage "https://github.com/nkootstra/cue"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nkootstra/cue/releases/download/v0.5.0/cue-aarch64-apple-darwin.tar.gz"
      sha256 "a47dd33c4c8b221e6b72abcaaa8b848497b1350be8793aa2a829368771a9d48d"
    else
      url "https://github.com/nkootstra/cue/releases/download/v0.5.0/cue-x86_64-apple-darwin.tar.gz"
      sha256 "db617d06bfdf4965c3fb1c4152dc4b1599f389c363424075c435f9a503a51bbd"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/nkootstra/cue/releases/download/v0.5.0/cue-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "55ebc963b0a61e642ee82a2d8a50a3bc694f04505ba9e6a0c22ec4bd9c492809"
    else
      url "https://github.com/nkootstra/cue/releases/download/v0.5.0/cue-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ea2212b7d05b89b45d7caf57476b39ce65d0e7b5820497f8cf2a3590a5a796e5"
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
    assert_equal "cue 0.5.0", shell_output("#{bin}/cue --version").strip
  end
end
