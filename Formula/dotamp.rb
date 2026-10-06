class Dotamp < Formula
  desc "Terminal music player drawn in dots: Plex-backed, with a braille spectrum analyzer"
  homepage "https://github.com/brady1408/dotamp"
  url "https://github.com/brady1408/dotamp/archive/refs/tags/v0.7.1.tar.gz"
  sha256 "0c572743b8ba945774cda587f5e325975f97072521eb1c9b2ba1348001f11938"
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
