class CephalonInterface < Formula
  include Language::Python::Virtualenv

  desc "API client and GUI app for interacting with Cephalon Intelligence research tools."
  homepage "https://cephalon.systems"
  url "https://files.pythonhosted.org/packages/19/87/4f9be76c5b1fe32c4b7365f983b284473d89280cf8040a78e61b0ceb5620/cephalon_interface-0.1.3.tar.gz"
  sha256 "41ea80b1f87f0029ae9483e96a5abfdcf2b8ff422b6fd94a0019453366c7c40c"

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

    system libexec/"bin/pip", "install", "altair==5.2.0", "annotated_types==0.6.0", "attrs==23.1.0", "blinker==1.7.0", "cachetools==5.3.2", "certifi==2023.11.17", "charset-normalizer==3.3.2", "click==8.1.7", "dateparser==1.2.0", "gitdb==4.0.11", "GitPython==3.1.40", "idna==3.6", "importlib_metadata==6.11.0", "Jinja2==3.1.2", "jsonschema==4.20.0", "jsonschema_specifications==2023.11.2", "loguru==0.7.2", "markdown-it-py==3.0.0", "MarkupSafe==2.1.3", "mdurl==0.1.2", "numpy==1.26.2", "packaging==23.2", "pandas==2.1.4", "pathlib==1.0.1", "pick==2.2.0", "Pillow==10.1.0", "protobuf==4.25.1", "pyarrow==14.0.1", "pycooltext==0.0.1", "pydantic==2.5.2", "pydantic_core==2.14.5", "pydeck==0.8.1b0", "pygments==2.17.2", "python-dateutil==2.8.2", "pytz==2023.3.post1", "referencing==0.32.0", "regex==2023.10.3", "requests==2.31.0", "result==0.15.0", "rich==13.7.0", "rich-click==1.7.2", "rpds_py==0.13.2", "six==1.16.0", "smmap==5.0.1", "streamlit==1.29.0", "tenacity==8.2.3", "toml==0.10.2", "toolz==0.12.0", "tornado==6.4", "typing_extensions==4.9.0", "tzdata==2023.3", "tzlocal==5.2", "urllib3==2.1.0", "validators==0.22.0", "watchdog==3.0.0", "zipp==3.17.0"
    virtualenv_install_with_resources
  end

  test do
    false
  end
end
