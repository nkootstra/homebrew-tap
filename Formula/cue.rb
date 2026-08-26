class Cue < Formula
  desc "Turn video and audio files into transcripts, subtitles, and descriptions"
  homepage "https://github.com/nkootstra/cue"
  version "0.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nkootstra/cue/releases/download/v0.4.1/cue-aarch64-apple-darwin.tar.gz"
      sha256 "506890fd514ff9afbeef77f9f3672d05525e1f1b49516ae16ffa9deaeb2b8545"
    else
      url "https://github.com/nkootstra/cue/releases/download/v0.4.1/cue-x86_64-apple-darwin.tar.gz"
      sha256 "5c546718b9800802e52b803d560cc00b0706c28dcd5be329e3f6d761f9094ca3"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/nkootstra/cue/releases/download/v0.4.1/cue-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d8bed1192451398937936cbe0f1542820f45edd4ab87a32707266a6431861403"
    else
      url "https://github.com/nkootstra/cue/releases/download/v0.4.1/cue-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "515cda31fb6422a26e89ef80b284b687e54bc3c04c382adad05b7024c67de0c2"
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
    assert_equal "cue 0.4.1", shell_output("#{bin}/cue --version").strip
  end
end
