class Cue < Formula
  desc "Turn video and audio files into transcripts, subtitles, and descriptions"
  homepage "https://github.com/nkootstra/cue"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nkootstra/cue/releases/download/v0.4.0/cue-aarch64-apple-darwin.tar.gz"
      sha256 "6219b4544fab8c8c89b46e65d9e3b5ef44580e16a1e6a13c9e8c00a6cf1d7cd4"
    else
      url "https://github.com/nkootstra/cue/releases/download/v0.4.0/cue-x86_64-apple-darwin.tar.gz"
      sha256 "8fdfcf3d2520ef2a4cc68f082c09a4c9b4302e1281dd6ec32a0a6cfc333d36cc"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/nkootstra/cue/releases/download/v0.4.0/cue-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "404e71f8bc7beb4fbe360bd8cf0fe4ac8f0aadc010093f829f84c9a7f3245bad"
    else
      url "https://github.com/nkootstra/cue/releases/download/v0.4.0/cue-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "254531a5545ba828ca4ded07ccc636c63c16d47666c63f360050a90f2ce8e083"
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
    assert_equal "cue #0.4.0", shell_output("#{bin}/cue --version").strip
  end
end
