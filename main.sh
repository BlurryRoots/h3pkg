#!/bin/bash

export H3PKG_HOME=$HOME/Workspace/Scripts/h3pkg
export H3PKG_INDEX=https://raw.githubusercontent.com/BlurryRoots/h3pkg-index/master/package.list
export H3PKG_REMOTE_HOME=ssh.informatik.haw-hamburg.de
export H3PKG_USER="no_user"
export H3PKG_PACKAGE_HOME="$HOME/Documents/haw-packages"

source $H3PKG_HOME/functions/sync.sh
source $H3PKG_HOME/functions/install.sh
source $H3PKG_HOME/functions/config.sh

# prints usage
function _h3pkg_usage () {
	echo "usage: h3pkg <cmd> [options] [args]"
}

# main function
function h3pkg () {
	if [ "$1" = "" ]; then
	{
		# if there is no parameter
		# print usage
		_h3pkg_usage
	}
	else
	{
		# pop parameter 1
		local cmd="$1"
		shift

		# switch on command
		case $cmd in
			"sync") {
				h3pkg_sync $@
			} ;;

			"install") {
				h3pkg_install $@
			} ;;

			"config") {
				h3pkg_config $@
			} ;;

			*) {
				echo "h3pkg: unknown command!"
				_h3pkg_usage
			} ;;
		esac
	}
	fi
}

