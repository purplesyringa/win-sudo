#!/usr/bin/env bash
function doInstall {
	if ! [ -L ~/bin ] && ! [ -d ~/bin ]; then
		echo make dir
		mkdir ~/bin
	else
		echo dir '~/bin' exist
	fi
	git clone https://github.com/imachug/win-sudo.git/s/ ~/bin
	git clone https://github.com/imachug/win-sudo.git/install.sh /tmp
}

function doFail {
	echo "failed to install, sorry :'(";
	exit 1
}
doInstall || doFail
echo "enjoy :)"
