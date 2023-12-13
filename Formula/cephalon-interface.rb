class CephalonInterface < Formula
  include Language::Python::Virtualenv
  PYTHON_VERSION = "3.11"

  desc "Shiny new formula"
  homepage "https://github.com/cephalon-intelligence/cephalon-interface"
  url "https://files.pythonhosted.org/packages/3b/01/be0e0411c40ce6ed996f48d949266650895b0fa8acf7eeee50e4d370392b/cephalon_interface-0.1.0.tar.gz"
  sha256 "10225ba130f32dfc7589b6f84aabcbb5f4e9f5dad4eb7f1626f83654fbb45229"

  depends_on "python@#{PYTHON_VERSION}"

  def install
    virtualenv_create(libexec, "python@#{PYTHON_VERSION}")
    virtualenv_install_with_resources
  end

  test do
    false
  end
end
