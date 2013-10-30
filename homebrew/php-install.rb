require 'formula'

class PHPInstall < Formula
  homepage 'https://github.com/marcosdsanchez/php-install#readme'
  url 'https://github.com/marcosdsanchez/php-install/archive/v0.0.1.tar.gz'
  sha1 ''

  head 'https://github.com/marcosdsanchez/php-install.git'

  def install
    system 'make', 'install', "PREFIX=#{prefix}"
  end
end
