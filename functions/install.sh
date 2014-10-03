#!/bin/bash

function _h3pkg_install_usage () {
	echo "h3pkg install <package name>"
}

function h3pkg_install () {
	# check if there is more than the package name
	[ $# -gt 1 ] && {
		_h3pkg_install_usage
		return 1
	}

	[ ! -f $H3PKG_HOME/index ] && {
		echo "No index found! Please run 'h3pkg sync' first!"
		return 1
	}

	[ "$H3PKG_USER" = "no_user" ] && {
		echo "Please configure your username! (run h3pkg config user <your name>)"
		return 1
	}

	local package_name="$1"
	local name
	local location
	local has_package=0

	# read package list file and get path
	while read line; do
		# extract the name followed by the location
		name=$(echo $line | cut -d" " -f1)
		location=$(echo $line | cut -d" " -f2)

		#echo "name $name : loca $loca"
		[ "$name" = "$package_name" ] && {
			echo "find package in $location"
			has_package=1
			break
		}
	done < $H3PKG_HOME/index

	[ $has_package -eq 0 ] && {
		echo "no package name $package_name found!"
		return 3
	}

	#
	local blob_address="https://raw.githubusercontent.com/${location}/master/package.sh"
	mkdir -p /tmp/h3pkg/${location}
	echo "Fetching build script from ${blob_address}"
	rm -rf /tmp/h3pkg/${location}/script
	curl ${blob_address} -o /tmp/h3pkg/${location}/script -#

	(source /tmp/h3pkg/${location}/script && {
		h3pkg_script_get_raw
		[ $? -ne 0 ] && {
			echo "Error getting raw data!"
			exit
		}

		h3pkg_script_build_package
		[ $? -ne 0 ] && {
			echo "Error building package!"
			exit
		}
	})

	return 0
}
