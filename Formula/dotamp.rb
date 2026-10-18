class Dotamp < Formula
  desc "Terminal music player drawn in dots: Plex-backed, with a braille spectrum analyzer"
  homepage "https://github.com/brady1408/dotamp"
  url "https://github.com/brady1408/dotamp/archive/refs/tags/v0.18.2.tar.gz"
  sha256 "512ff5b013483ecf5bc3b26a27a389d2be3dc5405b223595af78f2b65da46cfe"
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
