class Leyline < Formula
  desc "Native macOS window manager with per-Space controls"
  homepage "https://github.com/scshafe/leyline-wm"
  url "https://github.com/scshafe/leyline-wm/releases/download/v1.0.6/leyline-1.0.6-source.tar.gz"
  sha256 "c4fc0fee10e66404d601d5ef883ef13b3efb7887a1dff59faeda3532ddc4abea"
  version "1.0.6"
  license "MIT"
  depends_on macos: :sonoma
  depends_on "jq"

  def install
    # Homebrew already sandboxes the build; SwiftPM cannot nest sandbox-exec.
    system "bin/leylined-build", "--disable-sandbox"
    system "bin/leyline-recovery-app-build"
    system "/usr/bin/python3", "scripts/release/package_release.py", "--assemble-only", "--output", "assembled"
    libexec.install "assembled/Leyline.app", "assembled/Leyline Recovery.app", "install.sh"
    bin.write_exec_script libexec/"Leyline.app/Contents/Resources/leyline/bin/ley"
  end

  def caveats
    <<~EOS
      Run: ley install --start
      This copies both apps to ~/Applications and registers the per-user service.
      Allow Accessibility and Input Monitoring when requested.
      Local builds are ad-hoc signed; updates may require renewed permissions.
      Source builds require Swift 6 or newer from Xcode Command Line Tools.
    EOS
  end

  test do
    assert_match "1.0.6", shell_output("#{bin}/ley --version")
  end
end
