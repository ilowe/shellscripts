#!/bin/bash

function shs() {
	local cmd=$1
	shift

	case $cmd in
		up|update) _shs_update;;
		v|version) _shs_version;;
		*)
			echo 'abort: unknown command' >&2
			return 2
			;;
	esac
}

function _shs_version() {
	local version=$(echo version `git --work-tree ~/.shs --git-dir ~/.shs/.git tag -l | tail -n1`)

	[ "$version" = "version" ] && version=

	cecho "shs ${version} (build `git -C ~/.shs log -n1 --oneline | cut -d' ' -f1`)" $grey
}

function _shs_update() {
	[ ! -L ~/.shs ] && git --work-tree ~/.shs --git-dir ~/.shs/.git pull
	source ~/.bashrc
}

function _shs_unload() {
	unset shs
}

