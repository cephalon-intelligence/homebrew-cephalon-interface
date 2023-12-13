class CephalonInterface < Formula
  include Language::Python::Virtualenv

  desc "API client and GUI app for interacting with Cephalon Intelligence research tools."
  homepage "https://cephalon.systems"
  url "https://files.pythonhosted.org/packages/94/20/b63b86673454a6bbff6bcec792cbc9d7b773f9ee1d651640464770b22702/cephalon_interface-0.1.2.tar.gz"
  sha256 "6ac6492073e75ec4b4a434009254ec6033c5fa375cfbbab88e25294fe9a9a5af"

  depends_on "python@3.11"

  resource "pip" do
    url "https://files.pythonhosted.org/packages/1f/7f/4da15e07ccd11c84c1ccc8f6e24288d5e76c99441bf80e315b33542db951/pip-23.3.1.tar.gz"
    sha256 "1fcaa041308d01f14575f6d0d2ea4b75a3e2871fe4f9c694976f908768e14174"
  end

  def install
    virtualenv_create(libexec, "python3.11")

    resource("pip").stage do
      system libexec/"bin/python", "setup.py", "install"
    end

    system libexec/"bin/pip", "install", "cephalon-interface"
    virtualenv_install_with_resources
  end

  test do
    false
  end
end
