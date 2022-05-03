class Deadman < Formula
  include Language::Python::Virtualenv

  desc "deadman is a curses-based host status checking application using ping"
  homepage "https://github.com/upa/deadman"
  version "[ver 22.02.10]"
  license "MIT"
  head "https://github.com/upa/deadman.git", branch: "master"

  depends_on "python3"

  def install
    venv = virtualenv_create(libexec, "python3")

    # install deadman commands with PATH set to Python virtualenv environment
    bin.install Dir[bin/"deadman"]
    share.install Dir[share/"deadman.conf"]
    venv.pip_install_and_link buildpath
  end

  # def post_install
  #   system Formula["python3"].opt_bin/"python3", *Language::Python.setup_install_args(prefix)
  # end

  test do
    system "#{bin}/deadman", "--version"
  end
end
