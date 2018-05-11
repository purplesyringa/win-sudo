#!/usr/bin/env bash
shopt -s globstar extglob
function doInstall {
	if ! [ -L ~/bin/win-sudo ] && ! [ -d ~/bin/win-sudo ]; then
		mkdir ~/bin/win-sudo
	fi
	cd ~/bin/win-sudo; git init -q
	git config core.sparsecheckout true
	echo s/ >> .git/info/sparse-checkout
	git remote add -f origin https://github.com/DemonixCraft/win-sudo.git
	git pull origin master 
	git remote rm origin
}
function doFail {
	echo "failed to install, sorry :'(";
	exit 1
}
doInstall || doFail
extra_directories=(/*/Users/*/bin/win-sudo/s)
extra_path=$(printf "%s:" "${extra_directories[@]}")
eval "export PATH="${extra_path}${PATH}" >> ~/.bashrc"
source ~/.bashrc
echo $PATH
