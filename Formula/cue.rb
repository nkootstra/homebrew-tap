class Cue < Formula
  desc "Turn video and audio files into transcripts, subtitles, and descriptions"
  homepage "https://github.com/nkootstra/cue"
  version "0.13.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nkootstra/cue/releases/download/v0.13.0/cue-aarch64-apple-darwin.tar.gz"
      sha256 "3dd34877e014a4debed539374e7dd3bd7760a40713bdcd76c10d0146beaa0fd9"
    else
      url "https://github.com/nkootstra/cue/releases/download/v0.13.0/cue-x86_64-apple-darwin.tar.gz"
      sha256 "1e60536fac1d2fb96bb7643ba137c1cdb5a8411f271b7969791f016e64787866"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/nkootstra/cue/releases/download/v0.13.0/cue-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "23de8d253fd703c27e7810fb3a9223a4c1ee0e60e957fda1e0a8b61db7f3949b"
    else
      url "https://github.com/nkootstra/cue/releases/download/v0.13.0/cue-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4195477dc536e5cb05b327189dcffe24b450b9b76972b679cf2e22d8c2eb4f6d"
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
    assert_equal "cue #0.13.0", shell_output("#{bin}/cue --version").strip
  end
end
