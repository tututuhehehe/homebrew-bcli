class Bcli < Formula
  desc "Bilibili CLI: gRPC search, QR login, feeds, video info, parallel download"
  homepage "https://github.com/tututuhehehe/bilibili_cli"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tututuhehehe/bilibili_cli/releases/download/v1.0.0/bcli-aarch64-macos.tar.gz"
      sha256 "93967b56e2b532cada2e6cef81c33fffa8311302bc9ca94dc012b457eea263a0"

      def install
        bin.install "bcli"
      end
    else
      depends_on "rust" => :build
      url "https://codeload.github.com/tututuhehehe/bilibili_cli/tar.gz/refs/tags/v1.0.0"
      sha256 "a33de6c51a63971092a118b386b2df9aab25d8ba1c9296fa9a48ee4db5101c3a"

      def install
        system "cargo", "install", "--locked", "--root", prefix, "--path", "rust/app"
      end
    end
  end

  on_linux do
    depends_on "rust" => :build
    url "https://codeload.github.com/tututuhehehe/bilibili_cli/tar.gz/refs/tags/v1.0.0"
    sha256 "a33de6c51a63971092a118b386b2df9aab25d8ba1c9296fa9a48ee4db5101c3a"

    def install
      system "cargo", "install", "--locked", "--root", prefix, "--path", "rust/app"
    end
  end

  test do
    assert_match "bilibili_cli", shell_output("#{bin}/bcli help")
    assert_match "命令", shell_output("#{bin}/bcli help")
  end
end
