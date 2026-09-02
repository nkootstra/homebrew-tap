class Cue < Formula
  desc "Turn video and audio files into transcripts, subtitles, and descriptions"
  homepage "https://github.com/nkootstra/cue"
  version "0.15.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nkootstra/cue/releases/download/v0.15.0/cue-aarch64-apple-darwin.tar.gz"
      sha256 "d85173b516834055664bd3ef95f89b1f24e5b0aee8d9de594b97169eaae7dfa9"
    else
      url "https://github.com/nkootstra/cue/releases/download/v0.15.0/cue-x86_64-apple-darwin.tar.gz"
      sha256 "d9dd9c58eebfa9ce4399d6159a99ea60770b2cf6d39fd1be35095af624f19e8f"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/nkootstra/cue/releases/download/v0.15.0/cue-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4f92907528b7a82edb319bfebf9647b0067a16872b6e12f7bfb5731e0ddb9d78"
    else
      url "https://github.com/nkootstra/cue/releases/download/v0.15.0/cue-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "575020006d8b8ab495cd595eeffef920013d58eb166cd09723555298bb579105"
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
    assert_equal "cue 0.15.0", shell_output("#{bin}/cue --version").strip
  end
end
