# php-install 1 "Oct 2013" php-install "User Manuals"

## SYNOPSIS

`php-install` [PHP [VERSION]] [-- CONFIGURE_OPTS...]

## DESCRIPTION

Installs different versions of php

https://github.com/marcosdsanchez/php-install#readme

## ARGUMENTS

*PHP*
	Install PHP by name.

*VERSION*
	Optionally select the version of selected PHP.

*CONFIGURE_OPTS*
	Additional optional configure arguments.

## OPTIONS

`-s`, `--src-dir` *DIR*
	Specifies the directory for downloading and unpacking PHP source.

`-i`, `--install-dir` *DIR*
	Specifies the directory where PHP will be installed.
	Defaults to */opt/php_versions/$php-$version* for root and
	*~/.php_versions/$php-$version* for normal users.

`-M`, `--mirror` *URL*
	Specifies an altnerate mirror to download the PHP archive from.

`-u`, `--url` *URL*
	Alternate URL to download the PHP archive from.

`-m`, `--md5` *MD5*
	Specifies the MD5 checksum for the PHP archive.

`--no-download`
	Use the previously downloaded PHP archive.

`--no-verify`
	Do not verify the downloaded PHP archive.

`--no-install-deps`
	Do not install build dependencies before installing PHP.

`--no-reinstall`
	Skip installation if another PHP is detected in same location.

`-V`, `--version`
	Prints the current php-install version.

`-h`, `--help`
	Prints a synopsis of php-install usage.

## EXAMPLES

List supported PHP versions and their major versions:

    $ php-install

Install the current stable version of PHP:

    $ php-install php

Install a latest version of PHP:

    $ php-install php 5.4

Install a specific version of PHP:

    $ php-install php 5.3.14

Install a PHP version into a specific directory:

    $ php-install -i /usr/local/ php 5.3.3

Install a PHP version with specific configuration:

    $ php-install php stable -- --enable-mbstring

## FILES

*/usr/local/src*
	Default root user source directory.
    
*~/src*
	Default non-root user source directory.

*/opt/php_versions/$php-$version*
	Default root user installation directory.

*~/.php_versions/$php-$version*
	Default non-root user installation directory.

## AUTHOR

Marcos D. Sánchez <marcosdsanchez at gmail com>
