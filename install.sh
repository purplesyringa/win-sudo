#!/usr/bin/env bash
function doInstall {
	if ! [ -L ~/bin ] && ! [ -d ~/bin ]; then
		echo make dir
		mkdir /usr/bin
	else
		echo dir '/usr/bin' exist
	fi
	git clone https://github.com/DemonixCraft/win-sudo1.git/s /usr/bin
}

function doFail {
	echo "failed to install, sorry :'(";
	exit 1
}
doInstall || doFail
echo "enjoy :)"
