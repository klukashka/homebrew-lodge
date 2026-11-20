class Lodge < Formula
  desc "Cozy terminal scene of a lodge by a river, for tired wanderers"
  homepage "https://github.com/klukashka/Lodge"
  # The release workflow copies this file into the tap (klukashka/homebrew-lodge) and rewrites `url` and `sha256`
  # for the tagged source tarball, so these two lines change on every release.
  url "https://github.com/klukashka/Lodge/archive/refs/tags/v0.2.6.tar.gz"
  sha256 "210ab9e1faeb6a51f0ff259ddf6774c5d539fde8d2da97f8687aff35c15a78a0"
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
