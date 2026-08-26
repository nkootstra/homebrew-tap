class Cue < Formula
  desc "Turn video and audio files into transcripts, subtitles, and descriptions"
  homepage "https://github.com/nkootstra/cue"
  version "0.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nkootstra/cue/releases/download/v0.6.0/cue-aarch64-apple-darwin.tar.gz"
      sha256 "b0076e6fc949a50ace56450f754a94325f893794d52c033c1a8e54d062dcf421"
    else
      url "https://github.com/nkootstra/cue/releases/download/v0.6.0/cue-x86_64-apple-darwin.tar.gz"
      sha256 "d4563132e0882fd8472ce7d441009f0545007f00ae2f56a2029a36f417dd8a5c"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/nkootstra/cue/releases/download/v0.6.0/cue-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4d2c0b7c639d4daf9ac6025bd2a125b145d8102dcc330aee010c2084a2448fe5"
    else
      url "https://github.com/nkootstra/cue/releases/download/v0.6.0/cue-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f7f6c66a072b89383c77c4ea5d6af5c89a118d96cf80c00ba531e660c55e10df"
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
    assert_equal "cue 0.6.0", shell_output("#{bin}/cue --version").strip
  end
end
