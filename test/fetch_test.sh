. ./test/helper.sh

function setUp()
{
	PHP=php
}

function test_fetch()
{
	local key="5.3"
	local expected="5.3.28"
	local value=$(fetch "$PHP/versions" "$key")

	assertEquals "did not fetch the correct value" "$expected" "$value"
}

function test_fetch_with_excess_whitespace()
{
	local key="php-5.5.5.tar.bz2"
	local expected="186c330c272d6322d254db9b2d18482a"
	local value=$(fetch "$PHP/md5" "$key")

	assertEquals "did not fetch the correct value" "$expected" "$value"
}

function test_fetch_with_unknown_key()
{
	local key="foo"
	local expected=""
	local value=$(fetch "$PHP/versions" "$key")

	assertEquals "returned the wrong value" "$expected" "$value"
}

SHUNIT_PARENT=$0 . $SHUNIT2
