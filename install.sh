#!/usr/bin/env bash
function doInstall {
	if ! [ -L ~/bin/win-sudo ] && ! [ -d ~/bin/win-sudo ]; then
		mkdir ~/bin/win-sudo
	fi
	git clone https://github.com/DemonixCraft/win-sudo.git ~/bin/win-sudo && cd ~/bin/win-sudo/
	git rm -rq *.* && cd ~/bin/win-sudo/img | git rm -rq *.* | mv ~/bin/win-sudo/s/*.* ~/bin/win-sudo
}
function doFail {
	echo "failed to install, sorry :'(";
	exit 1
}
doInstall || doFail
PATH=$PATH:/c/Users/*/win-sudo
echo "enjoy :)"
