class Cue < Formula
  desc "Turn video and audio files into transcripts, subtitles, and descriptions"
  homepage "https://github.com/nkootstra/cue"
  version "0.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nkootstra/cue/releases/download/v0.3.1/cue-aarch64-apple-darwin.tar.gz"
      sha256 "3fa97c557826d393b20e914e2b87d2f144865d58cd0f2be13e77f9d87fda66df"
    else
      url "https://github.com/nkootstra/cue/releases/download/v0.3.1/cue-x86_64-apple-darwin.tar.gz"
      sha256 "341b6be84b95b79deb8c95072ae87cc289387953b77de091c8d580d33749e06d"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/nkootstra/cue/releases/download/v0.3.1/cue-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8d2b94a52f87d35e9f851e2543b18cf8142bdd6f04a6a278e1944a7fe8aba576"
    else
      url "https://github.com/nkootstra/cue/releases/download/v0.3.1/cue-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0425ae558b7c19deec50c55959a29cebd0df633276e17be0928ef6af3d1c7034"
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
    assert_equal "cue #0.3.1", shell_output("#{bin}/cue --version").strip
  end
end
