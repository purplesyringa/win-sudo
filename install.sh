#!/usr/bin/env bash
source <(curl -s https://github.com/DemonixCraft/win-sudo/master/doFail.sh)
trap 'doFail' ERR
function doInstall {
	mkdir -pv ~/bin/win-sudo && cd "$_"; git init -q
	git config core.sparsecheckout true
	echo s/ >> .git/info/sparse-checkout
	git remote add -mf origin https://github.com/DemonixCraft/win-sudo.git
	git pull -q origin master #Fetches new commits from Master Branch of project and doesn't show output
	git remote rm origin #Temp Command : Removes Origin so it will not mess up next install
	echo "source ~/bin/win-sudo/s/path.sh" | tee -a ~/.bashrc #Tells ~/.bashrc to use the code from path.sh upon startup
	#Warning : This will not work if '.bash_profile' in in your $HOME directory, as it will not source ~/bashrc upon startup
}
echo "enjoy :)"
exec bash #Refreshes current shell
