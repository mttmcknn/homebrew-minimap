class Minimap < Formula
  desc "Shared navigation memory for AI agents working in Android codebases"
  homepage "https://github.com/mttmcknn/minimap"
  url "https://github.com/mttmcknn/minimap/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "807bd611060674f3c1a50f854b33825b48f36e974b9a738cb080a9038cd830e0"
  license "Apache-2.0"
  head "https://github.com/mttmcknn/minimap.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/minimap-cli")
  end

  test do
    assert_match "Usage: minimap", shell_output("#{bin}/minimap --help")
    system bin/"minimap", "init", "--dry-run", "--agents", "all"
  end
end
