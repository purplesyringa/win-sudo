#!/usr/bin/env bash
function doInstall {
	mkdir -pv ~/bin/win-sudo #Makes directory in ~/bin/win-sudo,does not output error and outputs if dir is added
	cd ~/bin/win-sudo; git init -q #Makes a git repo in the new dir
	git config core.sparsecheckout true
	echo s/ >> .git/info/sparse-checkout
	git remote add -f origin https://github.com/DemonixCraft/win-sudo.git
	git pull -q origin master #Fetches new commits from Master Branch of project and doesn't show output
	git remote rm origin #Temp Command : Removes Origin so it will not mess up next install
	echo "source ~/bin/win-sudo/s/lines.sh" | tee -a ~/.bashrc #Tells ~/.bashrc to use the code from lines.sh upon startup
	. ~/.bashrc
	exec bash #Reloads current shell
	#WILL BE MUCH MORE COMPRESSED WHEN FINISHED
	#Warning : This will not work if '.bash_profile' in in your $HOME directory, as it will not source ~/bashrc upon startup
}
function doFail {
	echo "failed to install, sorry :'(";
	exit 1
}
doInstall || doFail
echo "enjoy :)"
