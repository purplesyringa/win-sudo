#!/usr/bin/env bash
function doInstall {
	if ! [ -L ~/bin/win-sudo ] && ! [ -d ~/bin/win-sudo ]; then
		mkdir ~/bin/win-sudo
	fi
	git clone git://github.com/DemonixCraft/win-sudo1.git/s ~/bin/win-sudo
}
function doFail {
	echo "failed to install, sorry :'(";
	exit 1
}
doInstall || doFail
PATH=$PATH:/c/Users/*/win-sudo
echo "enjoy :)"
