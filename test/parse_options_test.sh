. ./test/helper.sh

function setUp()
{
	unset PHP
	unset PHP_VERSION
	unset SRC_DIR
	unset INSTALL_DIR
}

function test_parse_options_with_no_arguments()
{
	parse_options >/dev/null 2>&1

	assertEquals "did not return 1" 1 $?
}

function test_parse_options_with_invalid_options()
{
	parse_options "--foo" "php" >/dev/null 2>&1

	assertEquals "did not return 1" 1 $?
}

function test_parse_options_with_one_argument()
{
	local expected="php"

	parse_options $expected

	assertEquals "did not set \$PHP" $expected $PHP
}

function test_parse_options_with_two_arguments()
{
	local expected_php="php"
	local expected_version="5.3.14"

	parse_options $expected_php $expected_version

	assertEquals "did not set \$PHP" $expected_php $PHP
	assertEquals "did not set \$PHP_VERSION" $expected_version \
		     				  $PHP_VERSION
}

function test_parse_options_with_more_than_two_arguments()
{
	parse_options "php" "5.4.14" "foo" >/dev/null 2>&1

	assertEquals "did not return 1" 1 $?
}

function test_parse_options_with_install_dir()
{
	local expected="/usr/local/"

	parse_options "--install-dir" $expected "php"

	assertEquals "did not set \$INSTALL_DIR" $expected $INSTALL_DIR
}

function test_parse_options_with_src_dir()
{
	local expected="~/src/"

	parse_options "--src-dir" $expected "php"

	assertEquals "did not set \$SRC_DIR" $expected $SRC_DIR
}

function test_parse_options_with_url()
{
	local url="http://us3.php.net/get/php-5.4.21.tar.bz2/from/am1.php.net/mirror"

	parse_options "--url" "$url" "php"

	assertEquals "did not set \$PHP_URL" "$url" "$PHP_URL"
}

function test_parse_options_with_md5()
{
	local md5="5d41402abc4b2a76b9719d911017c592"

	parse_options "--md5" "$md5" "php"

	assertEquals "did not set \$RUBY_PHP" "$md5" "$PHP_MD5"
}

function test_parse_options_with_no_download()
{
	parse_options "--no-download" "php"

 	assertEquals "did not set \$NO_DOWNLOAD" 1 $NO_DOWNLOAD
}

function test_parse_options_with_no_verify()
{
	parse_options "--no-verify" "php"

 	assertEquals "did not set \$NO_VERIFY" 1 $NO_VERIFY
}

function test_parse_options_with_no_install_deps()
{
	parse_options "--no-install-deps" "php"

 	assertEquals "did not set \$NO_INSTALL_DEPS" 1 $NO_INSTALL_DEPS
}

function test_parse_options_with_no_reinstall()
{
	parse_options "--no-reinstall" "php"

	assertEquals "did not set to \$NO_REINSTALL" 1 $NO_REINSTALL
}

function test_parse_options_with_additional_options()
{
	local expected=(--enable-shared CFLAGS="-03")

	parse_options "php" "--" $expected

	assertEquals "did not set \$CONFIGURE_OPTS" $expected $CONFIGURE_OPTS
}

function test_parse_options_with_additional_options_with_spaces()
{
	parse_options "php" "--" --enable-mbstring CFLAGS="-march=auto -O2"

	assertEquals "did not word-split \$CONFIGURE_OPTS correctly" \
          'CFLAGS=-march=auto -O2' "${CONFIGURE_OPTS[1]}"
}

SHUNIT_PARENT=$0 . $SHUNIT2
