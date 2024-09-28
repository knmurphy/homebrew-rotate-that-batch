class RotateThatBatch < Formula
  include Language::Python::Virtualenv

  desc "A utility for rotating batches"
  homepage "https://github.com/knmurphy/rotate-that-batch"
  url "https://github.com/knmurphy/rotate-that-batch/archive/v0.1.0.tar.gz"
  sha256 "the_sha256_of_your_release_tarball"
  license "MIT"

  depends_on "poetry"
  depends_on "python@3.9"

  def install
    venv = virtualenv_create(libexec, "python3")
    system "poetry", "build"
    venv.pip_install Dir["dist/*.whl"].first
    bin.install_symlink libexec/"bin/rotate-that-batch"
  end

  test do
    assert_match "Welcome to Rotate That Batch!", shell_output("#{bin}/rotate-that-batch --help")
  end
end
