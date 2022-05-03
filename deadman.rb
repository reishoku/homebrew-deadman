class Deadman < Formula

  desc "deadman is a curses-based host status checking application using ping"
  homepage "https://github.com/upa/deadman"
  version "[ver 22.02.10]"
  license "MIT"
  head "https://github.com/upa/deadman.git", branch: "master"

  depends_on "python3"

  def install
    bin.install Dir[buildpath/"deadman"]
    share.install Dir[buildpath/"deadman.conf"]
  end

  test do
    system "#{bin}/deadman", "--help"
  end
end
