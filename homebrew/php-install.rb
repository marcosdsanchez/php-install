require 'formula'

class PhpInstall < Formula
  homepage 'https://github.com/marcosdsanchez/php-install#readme'
  url 'https://github.com/marcosdsanchez/php-install/archive/v0.0.1.tar.gz'
  sha1 '828736801c9c5759ae973b60c7bb5e6fcfacd0e5'

  head 'https://github.com/marcosdsanchez/php-install.git'

  def install
    system 'make', 'install', "PREFIX=#{prefix}"
  end
end
