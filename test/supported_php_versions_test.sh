. ./test/helper.sh

function test_known_php_versions()
{
	local output="$(known_php_distributions)"

	assertTrue "did not include php" '[[ "$output" == *php* ]]'
}

SHUNIT_PARENT=$0 . $SHUNIT2
