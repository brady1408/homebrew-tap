class Dotamp < Formula
  desc "Terminal music player drawn in dots: Plex-backed, with a braille spectrum analyzer"
  homepage "https://github.com/brady1408/dotamp"
  url "https://github.com/brady1408/dotamp/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "f134f4a22b92ea1b44affd8a49dec85bab773b239f61de36ee2cef1281169e90"
  license "MIT"
  head "https://github.com/brady1408/dotamp.git", branch: "main"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=v#{version}"), "./cmd/dotamp"
  end

  test do
    assert_match "dotamp v#{version}", shell_output("#{bin}/dotamp --version")
  end
end
