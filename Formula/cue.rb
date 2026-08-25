class Cue < Formula
  desc "Turn video and audio files into transcripts, subtitles, and descriptions"
  homepage "https://github.com/nkootstra/cue"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nkootstra/cue/releases/download/v0.2.0/cue-aarch64-apple-darwin.tar.gz"
      sha256 "8190069ce9d6700fcb119209c391db47b3e12d08386de370c0ef2f7e4e954742"
    else
      url "https://github.com/nkootstra/cue/releases/download/v0.2.0/cue-x86_64-apple-darwin.tar.gz"
      sha256 "7d3ab028e78a9c0861bee22b608a7d798f260893ba5ac93f05c9d64e16ca330e"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/nkootstra/cue/releases/download/v0.2.0/cue-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4ec3522c8e8c9f5dd78f8b75a09f324a8429d1bf9ce12ec641b066de093480b3"
    else
      url "https://github.com/nkootstra/cue/releases/download/v0.2.0/cue-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ea0700d1f47163c0ecf5029fd65cf33509f5112452a1c93cd1bb37ae089824b5"
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
    assert_equal "cue #0.2.0", shell_output("#{bin}/cue --version").strip
  end
end
