#!/usr/bin/env bash
exec 5> debug_output.txt
BASH_XTRACEFD="5"
PS4='$LINENO: '
set -x
function doInstall {
	if ! [ -L ~/bin ] && ! [ -d ~/bin ]; then
		echo make dir
		mkdir /usr/bin
	else
		echo dir '/usr/bin' exist
	fi
	git clone https://github.com/DemonixCraft/win-sudo1.git/tree/master/s/ /usr/bin
	git clone https://github.com/DemonixCraft/win-sudo1.git/blob/master/install.sh /tmp
}

function doFail {
	echo "failed to install, sorry :'(";
	exit 1
}
doInstall || doFail
echo "enjoy :)"
