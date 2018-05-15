#!/usr/bin/env bash
function doInstall {
	#if ! [ -L ~/bin/win-sudo ] && ! [ -d ~/bin/win-sudo ]; then
	mkdir -pv ~/bin/win-sudo
	cd ~/bin/win-sudo; git init -q
	git config core.sparsecheckout true
	echo s/ >> .git/info/sparse-checkout
	git remote add -f origin https://github.com/DemonixCraft/win-sudo.git
	git pull origin master 
	git remote rm origin
	#extra_directories=(/c/Users/*/bin/win-sudo/s)
	#extra_path=$(printf "%s:" "${extra_directories[@]}")
	#export PATH="${extra_path}${PATH}" >> ~/.bashrc
	#____________________________________________________
	#cat ~/bin/win-sudo/s/lines.txt >> ~/.bashrc
	#echo -e "export PATH=~/bin/win-sudo/s:$PATH" >> ~/.bashrc
	export PATH="$PATH:~/bin/win-sudo/s" >> ~/.bash_profile
	source ~/.bash_profile
	#NEEDS A LOT MORE TESTING. WILL BE MUCH MORE COMPRESSED WHEN FINISHED
}
function doFail {
	echo "failed to install, sorry :'(";
	exit 1
}
doInstall || doFail
echo "enjoy :)"
echo $PATH #Echoes $PATH to see if it appended the new value
sudo #Tests if 'sudo' works in script
