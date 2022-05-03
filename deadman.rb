class Deadman < Formula
  include Language::Python::Virtualenv

  desc "deadman is a curses-based host status checking application using ping"
  homepage "https://github.com/upa/deadman"
  version "[ver 22.02.10]"
  license "MIT"
  head "https://github.com/upa/deadman.git", branch: "master"

  depends_on "python3"

  # resource "requests" do
  #   url "https://pypi.io/packages/source/r/requests/requests-2.27.1.tar.gz"
  #   sha256 "68d7c56fd5a8999887728ef304a6d12edc7be74f1cfa47714fc8b414525c9a61"
  # end

  # resource "chardet" do
  #   url "https://pypi.io/packages/source/c/chardet/chardet-4.0.0.tar.gz"
  #   sha256 "0d6f53a15db4120f2b08c94f11e7d93d2c911ee118b6b30a04ec3ee8310179fa"
  # end

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install resources

    # system "#{libexec}/bin/python", "setup.py",
    #                  "configure",
    #                  "--prefix=#{libexec}"
    # system "#{libexec}/bin/python", "setup.py",
    #                  "--no-user-cfg",
    #                  "--no-update-icon-cache",
    #                  "--no-compile-schemas",
    #                  "install"

    # install deadman commands with PATH set to Python virtualenv environment
    bin.install Dir[bin/"deadman"]
    share.install Dir[share/"deadman.conf"]
    venv.pip_install_and_link buildpath
  end

  def post_install
    system Formula["python3"].opt_bin/"python3", *Language::Python.setup_install_args(prefix)
  end

  test do
    system "#{bin}/deadman", "--version"
  end
end
