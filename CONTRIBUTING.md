# Contributing

## Code Style

* Tab indent code.
* Keep code within 80 columns.
* Use [bash] 3.x features.
* Use the `function` keyword for functions.
* Quote all String variables.
* Prefer single-line expressions where appropriate:

        [[ -n "$foo" ]] && other command

        if   [[ "$foo" == "bar" ]]; then command
        elif [[ "$foo" == "baz" ]]; then other_command
        fi

        case "$foo" in
        	bar) command ;;
        	baz) other_command ;;
        esac

## Pull Request Guidelines

* Utility functions should go into `share/php-install/php-install.sh`.
* Generic installation steps should go into `share/php-install/functions.sh`.
* PHP specific installation steps should go into
  `share/php-install/$php/functions.sh` and may override the generic steps in
  `share/php-install/functions.sh`.
* PHP build dependencies should go into
  `share/php-install/$php/dependencies.txt`.
* PHP md5 checksums should go into `share/php-install/$php/md5.txt`.
* PHP version aliases should go into `share/php-install/$php/versions.txt`.
* All new code must have [shunit2] unit-tests.

### What Will Not Be Accepted

* Options for PHP specific `./configure` options. You can pass additional
  configuration options like so:

        php-install php 5.5 -- --foo --bar

* Excessive OS specific workarounds. We should strive to fix any PHP build
  issues or OS environment issues.
* Building PHP from HEAD. This is risky and may result in a buggy/broken
  version of PHP. The user should build development versions of PHP by hand
  and report any bugs to upstream.

[Makefile]: https://gist.github.com/3224049
[shunit2]: http://code.google.com/p/shunit2/

[bash]: http://www.gnu.org/software/bash/
