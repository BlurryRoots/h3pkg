#!/bin/bash

function _h3pkg_sync_usage () {
	echo "h3pkg sync"
}

function h3pkg_sync () {
	# check if there is more than the package name
	[ $# -gt 0 ] && {
		echo "Too much arguments!"
		_h3pkg_sync_usage

		return 1
	}

	echo "Syncing from $H3PKG_INDEX"
	curl "$H3PKG_INDEX" -o "$H3PKG_PACKAGE_HOME/.cache/index" -#

	return 0
}

# call main function
h3pkg_sync $@
