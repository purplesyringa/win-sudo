#!/usr/bin/env bash
curl -sSf https://raw.githubusercontent.com/DemonixCraft/win-sudo/master/doFail.sh | bash
trap 'doFail' ERR #If any of the following lines output 0, run doFail and exit
mkdir -pv ~/bin/win-sudo && cd "$_"; git init -q #Create dir > Navigate to new dir > Quietly initiate a git repo in current dir
git config core.sparsecheckout true #Sets 'sparsecheckout' boolean to 'true'
echo s/ >> .git/info/sparse-checkout #Send line "s/" to info/sparse-checkout
git remote add -mf origin https://github.com/DemonixCraft/win-sudo.git #Add url to origin
git pull -q origin master #Fetches new commits from Master Branch of project and doesn't show output
git remote rm origin #Temp Command : Removes Origin so it will not mess up next install
echo "source ~/bin/win-sudo/s/path.sh" | tee -a ~/.bashrc #Tells ~/.bashrc to use the code from path.sh upon startup
#Warning : This will not work if '.bash_profile' in in your $HOME directory, as it will not source ~/bashrc upon startup
echo "enjoy :)"
exec bash #Refreshes current shell
