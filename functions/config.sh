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
	[ ! -e $H3PKG_HOME/config ] && {
		mkdir -p $H3PKG_HOME/config
	}

	#
	local key="$1"
	local value="$2"
	local failed=0

	#
	case $key in
		"package_home") {
			#echo "package_home $value" > $H3PKG_HOME/config
			echo $value > $H3PKG_HOME/config/package-home
		} ;;

		"user") {
			echo $value > $H3PKG_HOME/config/user
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

# call main function
h3pkg_config $@
