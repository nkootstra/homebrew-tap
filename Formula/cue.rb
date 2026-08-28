class Cue < Formula
  desc "Turn video and audio files into transcripts, subtitles, and descriptions"
  homepage "https://github.com/nkootstra/cue"
  version "0.10.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nkootstra/cue/releases/download/v0.10.0/cue-aarch64-apple-darwin.tar.gz"
      sha256 "69e90cd1ee92c8dd8bd7891a10534de70acff3d131e2c897fecc4e852a5907dd"
    else
      url "https://github.com/nkootstra/cue/releases/download/v0.10.0/cue-x86_64-apple-darwin.tar.gz"
      sha256 "f06a9680c7c4a68f0672d165cc63c080e246386d53e632460713a2428d0d8c42"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/nkootstra/cue/releases/download/v0.10.0/cue-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1cf9d6ae6fd4f12ec5269178715b6494c05b55cae03d35efc3f4adb134ae6860"
    else
      url "https://github.com/nkootstra/cue/releases/download/v0.10.0/cue-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b40662b5a1672eadd68580b4c07a060b004d261ce64aac025936fdc395d9b5ee"
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
    assert_equal "cue #0.10.0", shell_output("#{bin}/cue --version").strip
  end
end
