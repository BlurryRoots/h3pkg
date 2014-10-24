#!/bin/bash

export H3PKG_HOME=$HOME/Workspace/Scripts/h3pkg
export H3PKG_INDEX=https://raw.githubusercontent.com/BlurryRoots/h3pkg-index/master/package.list
export H3PKG_REMOTE_HOME=ssh.informatik.haw-hamburg.de
export H3PKG_USER="no_user"
export H3PKG_PACKAGE_HOME="$HOME/Documents/haw-packages"

# prints usage
function _h3pkg_usage () {
	echo "usage: h3pkg <cmd> [options] [args]"
}

# main function
function h3pkg () {
	[ "$1" = "" ] && {
		# if there is no parameter
		# print usage
		_h3pkg_usage
	} || {
		# pop parameter 1
		local cmd="$1"
		shift

		# update config variables
		[ -e $H3PKG_HOME/config/user ] && {
			export H3PKG_USER=`cat $H3PKG_HOME/config/user`
		}
		[ -e $H3PKG_HOME/config/package-home ] && {
			export H3PKG_PACKAGE_HOME=`cat $H3PKG_HOME/config/package-home`
		}

		# prepare shell to run subfunctions
		local runner
		[ -e $SHELL ] && {
			runner=$SHELL
		} || {
			runner=sh
		}

		# switch on command
		case $cmd in
			"sync") {
				$runner $H3PKG_HOME/functions/sync.sh $@
			} ;;

			"install") {
				$runner $H3PKG_HOME/functions/install.sh $@
			} ;;

			"config") {
				$runner $H3PKG_HOME/functions/config.sh $@
			} ;;

			*) {
				echo "h3pkg: unknown command!"
				_h3pkg_usage
			} ;;
		esac
	}
}

