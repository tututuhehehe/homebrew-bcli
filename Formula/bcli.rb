class Bcli < Formula
  desc "Bilibili CLI: gRPC search, QR login, feeds, video info, parallel download"
  homepage "https://github.com/tututuhehehe/bilibili_cli"
  url "https://codeload.github.com/tututuhehehe/bilibili_cli/tar.gz/refs/tags/v1.0.0"
  sha256 "a33de6c51a63971092a118b386b2df9aab25d8ba1c9296fa9a48ee4db5101c3a"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "rust/app"
  end

  test do
    assert_match "bilibili_cli", shell_output("#{bin}/bcli help")
    assert_match "命令", shell_output("#{bin}/bcli help")
  end
end
