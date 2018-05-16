#!/usr/bin/env bash
function doInstall {
	mkdir -pv ~/bin/win-sudo
	cd ~/bin/win-sudo; git init -q
	git config core.sparsecheckout true
	echo s/ >> .git/info/sparse-checkout
	git remote add -f origin https://github.com/DemonixCraft/win-sudo.git
	git pull origin master 
	git remote rm origin
	#cat ~/bin/win-sudo/s/lines.txt >> ~/.bashrc
	#echo -e "export PATH=~/bin/win-sudo/s:$PATH" >> ~/.bashrc
	echo "source ~/bin/win-sudo/s/lines.sh" | tee -a ~/.bashrc
	source ~/.bashrc
	#WILL BE MUCH MORE COMPRESSED WHEN FINISHED
}
function doFail {
	echo "failed to install, sorry :'(";
	exit 1
}
doInstall || doFail
echo "enjoy :)"
