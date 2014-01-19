# php-install

[![Build Status](https://travis-ci.org/marcosdsanchez/php-install.png?branch=master)](https://travis-ci.org/marcosdsanchez/php-install)

Installs different versions of php. (Based on [ruby-install](http://github.com/postmodern/ruby-install) )

## Features

* Supports installing arbitrary versions.
* Supports installing into `/opt/php_versions/` for root and `~/.php_versions/` for users
  by default.
* Supports installing into arbitrary directories.
* Supports downloading from mirrors.
* Supports downloading/applying patches.
* Supports applying arbitrary patches.
* Supports specifying arbitrary `./configure` options.
* Supports downloading archives using `wget` or `curl`.
* Supports verifying downloaded archives using `md5sum` or `md5`.
* Supports installing build dependencies via the package manager:
  * [apt]
  * [yum]
  * [pacman]
  * [brew]
* Has tests.

## Anti-Features

* Does not require updating every time a new PHP version comes out.
* Does not require recipes for each individual PHP version or configuration.

## Requirements

* [bash]
* [wget] or [curl]
* `md5sum` or `md5`
* `tar`

## Synopsis

List supported PHP versions and their major versions:

    $ php-install

Install the current stable version of PHP:

    $ php-install php

Install a latest version of PHP:

    $ php-install php 5.5

Install a specific version of PHP:

    $ php-install php 5.4.13

Install a PHP into a specific directory:

    $ php-install -i /usr/local/ php 5.4.13

Install a PHP version with specific configuration:

    $ php-install php 5.4.3 -- --enable-debug --without-pear

## Install

    wget -O php-install-0.0.2.tar.gz https://github.com/marcosdsanchez/php-install/archive/v0.0.2.tar.gz
    tar -xzvf php-install-0.0.2.tar.gz
    cd php-install-0.0.2/
    sudo make install

## Credits

* Thanks Postmodern for creating ruby-install.
