class Cue < Formula
  desc "Turn video and audio files into transcripts, subtitles, and descriptions"
  homepage "https://github.com/nkootstra/cue"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nkootstra/cue/releases/download/v0.1.1/cue-aarch64-apple-darwin.tar.gz"
      sha256 "b10d4a6447906c16244ad632de35ef6a4a36602c1800f6ad2ac0e6dec1d09977"
    else
      url "https://github.com/nkootstra/cue/releases/download/v0.1.1/cue-x86_64-apple-darwin.tar.gz"
      sha256 "9a935abd864092b0f7d376bf31932b9d9b39562318e3e04f6916ed16fd6e711b"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/nkootstra/cue/releases/download/v0.1.1/cue-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a87e586223fadb486b8793fe65fa999a1f5b8a839bba767fb969d94a4a27e026"
    else
      url "https://github.com/nkootstra/cue/releases/download/v0.1.1/cue-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0459294853b6e1829ccc8d8816e0f2f50502f27e67ae61825a1be5bc884b35e0"
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
    assert_equal "cue #0.1.1", shell_output("#{bin}/cue --version").strip
  end
end
