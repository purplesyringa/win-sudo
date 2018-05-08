#!/usr/bin/env bash
function doInstall {
	if ! [ -L ~/bin/win-sudo ] && ! [ -d ~/bin/win-sudo ]; then
		mkdir ~/bin/win-sudo
	fi
	#git clone https://github.com/DemonixCraft/win-sudo.git/s ~/bin/win-sudo
	git clone https://github.com/DemonixCraft/win-sudo.git ~/bin/win-sudo && cd ~/bin/win-sudo | git rm img/screenshot.gif README.md install.sh
	#git rm img/screenshot.gif README.md install.sh
}
function doFail {
	echo "failed to install, sorry :'(";
	exit 1
}
doInstall || doFail
PATH=$PATH:/c/Users/*/win-sudo
echo "enjoy :)"
