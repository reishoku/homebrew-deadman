class Deadman < Formula

  desc "deadman is a curses-based host status checking application using ping"
  homepage "https://github.com/upa/deadman"
  version "[ver 22.02.10]"
  license "MIT"
  head "https://github.com/upa/deadman.git", branch: "master"

  depends_on "python3"

  def install
    bin.install "deadman"
    share.install "deadman.conf"
  end

  def caveats
    <<~EOS
      You need to copy configuration file to your home directory manually.
      Simply run:
        cp $(brew --prefix)/share/deadman.conf ~/.config/deadman.conf
    EOS
  end

  test do
    system "#{bin}/deadman", "--help"
  end
end
