class Lodge < Formula
  desc "Cozy terminal scene of a lodge by a river, for tired wanderers"
  homepage "https://github.com/klukashka/Lodge"
  # The release workflow copies this file into the tap (klukashka/homebrew-lodge) and rewrites `url` and `sha256`
  # for the tagged source tarball, so these two lines change on every release.
  url "https://github.com/klukashka/Lodge/archive/refs/tags/v0.2.3.tar.gz"
  sha256 "c594ce807d34b963516a63dde374dbc04e5005548797af6bd0e3ed27e10a1219"
  license "MIT"
  head "https://github.com/klukashka/Lodge.git", branch: "main"

  def install
    system "make", "UNIVERSAL=0", "VERSION=#{version}"
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    assert_path_exists bin/"lodge"
    assert_path_exists share/"lodge/texts/lodge_pic.txt"
    assert_match version.to_s, shell_output("#{bin}/lodge-bin --version").strip
  end
end
