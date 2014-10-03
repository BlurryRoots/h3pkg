#!/bin/bash

function _h3pkg_config_usage () {
	echo "h3pkg config <package name> <value>"
}

function h3pkg_config () {
	# check if there is more than the package name
	[ $# -ne 2 ] && {
		_h3pkg_config_usage
		return 1
	}

	#
	local key="$1"
	local value="$2"
	local failed=0

	#
	case $key in
		"package_home") {
			#echo "package_home $value" > $H3PKG_HOME/config
			export H3PKG_PACKAGE_HOME="$value"
		} ;;

		"user") {
			export H3PKG_USER="$value"
		} ;;

		*) {
			_h3pkg_config_usage
			failed=1
		} ;;
	esac

	[ $failed -eq 1 ] && {
		echo "Key $key is unknown!"
	}

	return $failed
}
