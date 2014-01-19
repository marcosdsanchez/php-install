. ./test/helper.sh

function setUp()
{
	PHP="php"
	PHP_VERSION="5.3"
	EXPANDED_PHP_VERSION="5.3.28"
}

function test_load_php()
{
	load_php

	assertEquals "did not return 0" 0 $?
}

function test_load_php_with_invalid_PHP()
{
	PHP="foo"

	load_php 2>/dev/null

	assertEquals "did not return 1" 1 $?
}

function test_PHP_VERSION()
{
	load_php

 assertEquals "did not expand PHP_VERSION" \
                     "$EXPANDED_PHP_VERSION" \
                     "$PHP_VERSION"
}

function test_load_php_with_PHP_URL()
{
	local url="http://mirror.s3.amazonaws.com/downloads/php-1.2.3.tar.gz"

	PHP_URL="$url"
	load_php

	assertEquals "did not preserve PHP_URL" "$url" "$PHP_URL"
}

function test_load_php_PHP_MD5()
{
	load_php

	assertNotNull "did not set PHP_MD5" $PHP_MD5
}

function test_load_php_with_PHP_MD5()
{
	local md5="25ae23a5b9615fe8d33de5b63e1bb788"

	PHP_MD5="$md5"
	load_php

	assertEquals "did not preserve PHP_MD5" "$md5" "$PHP_MD5"
}

function test_SRC_DIR()
{
	load_php

	if (( $UID == 0 )); then
		assertEquals "did not correctly default SRC_DIR" \
			     "/usr/local/src" \
			     "$SRC_DIR"
	else
		assertEquals "did not correctly default SRC_DIR" \
			     "$HOME/src" \
			     "$SRC_DIR"
	fi
}

function test_INSTALL_DIR()
{
	load_php

	if (( $UID == 0 )); then
		assertEquals "did not correctly default INSTALL_DIR" \
			     "/opt/php_versions/$PHP-$PHP_VERSION" \
			     "$INSTALL_DIR"
	else
		assertEquals "did not correctly default INSTALL_DIR" \
			     "$HOME/.php_versions/$PHP-$PHP_VERSION" \
			     "$INSTALL_DIR"
	fi
}

function tearDown()
{
	unset SRC_DIR INSTALL_DIR
	unset PHP PHP_VERSION PHP_MD5 PHP_ARCHIVE PHP_SRC_DIR PHP_URL
}

SHUNIT_PARENT=$0 . $SHUNIT2
