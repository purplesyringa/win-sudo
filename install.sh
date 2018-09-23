#!/usr/bin/env bash
# Begin install aliases
shopt -s expand_aliases
alias ws-script-start="echo Downloading win-sudo...;trap 'echo Failed to install, sorry :(; exit 1' ERR"
alias init-gitrepo-setup="git init -q && git config core.sparsecheckout true ; echo s/ >> .git/info/sparse-checkout"
alias ws-success="echo Win-sudo successfully installed!;exec bash"
alias gramf="git remote add -mf base"
alias ws-files="~/.bashrc ~/.bash_profile /etc/profile"
alias null=">/dev/null 2>&1"
# End install alias

ws-script-start
# clean default install dir
if test -d ~/bin/win-sudo ; then
  rm -rfv ~/bin/win-sudo
fi  
# download latest sources to a fresh directory 
mkdir -pv ~/bin/win-sudo && cd "$_";init-gitrepo-setup && gramf https://github.com/imachug/win-sudo.git && git pull -q base master
# start processing bash initialization files
touch ~/.bashrc
for f in ~/.bashrc ~/.bash_profile # /.profile leaving it out to avoid permission issues atleast in git bash
do
 echo "Processing $f"
 if test -f $f ; then
  if grep -q "source ~/bin/win-sudo/s/path.sh" $f; then
    echo "sudo initialization already in file " $f
    break
   else
    echo "appending sudo initialization to " $f
    echo "source ~/bin/win-sudo/s/path.sh" | tee -a $f 
    break
  fi
 fi
done
source ~/bin/win-sudo/s/path.sh
ws-success
