if (( $UID == 0 )); then
	SRC_DIR="${SRC_DIR:-/usr/local/src}"
	INSTALL_DIR="${INSTALL_DIR:-/opt/php_versions/$PHP-$PHP_VERSION}"
else
	SRC_DIR="${SRC_DIR:-$HOME/src}"
	INSTALL_DIR="${INSTALL_DIR:-$HOME/.php_versions/$PHP-$PHP_VERSION}"
fi

#
# Pre-install tasks
#
function pre_install()
{
	mkdir -p "$SRC_DIR"
	mkdir -p "${INSTALL_DIR%/*}"
}

#
# Install PHP Dependencies
#
function install_deps()
{
	local packages="$(fetch "$PHP/dependencies" "$PACKAGE_MANAGER")"

	if [[ -n "$packages" ]]; then
		log "Installing dependencies for $PHP $PHP_VERSION ..."
		install_packages $packages
	fi

	install_optional_deps
}

#
# Install any optional dependencies.
#
function install_optional_deps() { return; }

#
# Download the PHP archive
#
function download_php()
{
	log "Downloading $PHP_URL into $SRC_DIR ..."
	download "$PHP_URL" "$SRC_DIR/$PHP_ARCHIVE"
}

#
# Verifies the PHP archive matches a checksum.
#
function verify_php()
{
	if [[ -n "$PHP_MD5" ]]; then
		log "Verifying $PHP_ARCHIVE ..."
		verify "$SRC_DIR/$PHP_ARCHIVE" "$PHP_MD5"
	else
		warn "No checksum for $PHP_ARCHIVE. Proceeding anyways"
	fi
}

#
# Extract the PHP archive
#
function extract_php()
{
	log "Extracting $PHP_ARCHIVE ..."
	extract "$SRC_DIR/$PHP_ARCHIVE" "$SRC_DIR"
}

#
# Place holder function for configuring PHP.
#
function configure_php() { return; }

#
# Place holder function for compiling PHP.
#
function compile_php() { return; }

#
# Place holder function for installing PHP.
#
function install_php() { return; }

#
# Place holder function for post-install tasks.
#
function post_install() { return; }
