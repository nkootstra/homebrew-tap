class Cue < Formula
  desc "Turn video and audio files into transcripts, subtitles, and descriptions"
  homepage "https://github.com/nkootstra/cue"
  version "0.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nkootstra/cue/releases/download/v0.7.0/cue-aarch64-apple-darwin.tar.gz"
      sha256 "71c07e9ca5b23c3a34ed2bada25c2bc5b667ffec555104c3a301c02ab8404c0c"
    else
      url "https://github.com/nkootstra/cue/releases/download/v0.7.0/cue-x86_64-apple-darwin.tar.gz"
      sha256 "680ef7bc28183b7292b54c579af14fa94341cb6e17e55c313df46959ecc986ce"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/nkootstra/cue/releases/download/v0.7.0/cue-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1c20fc4ab2b7244ec9d48c75ce60fbffe7b64130eb696fa1f5ad75c562ba2c2e"
    else
      url "https://github.com/nkootstra/cue/releases/download/v0.7.0/cue-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0a26968da45a89f7f5001d23360cecfe5a46642fb2abd0be320d822568a912e0"
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
    assert_equal "cue 0.7.0", shell_output("#{bin}/cue --version").strip
  end
end
