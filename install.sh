#!/usr/bin/env bash
shopt -s expand_aliases
function ws-script-start {
  echo "Downloading win-sudo..."
  trap 'echo "Failed to install, sorry :("; exit 1' ERR
}
function ws-success {
  echo Win-sudo successfully installed!
  exec bash
  alias fresh="exec bash"
}
function init-gitrepo-setup {
  git init -q
  git config core.sparsecheckout true
  echo s/ >> .git/info/sparse-checkout
}
alias gramf="git remote add -mf base"
alias ws-files="~/.bashrc ~/.bash_profile /etc/profile"
alias null=">/dev/null 2>&1"
ws-script-start
 rm -rfv ~/bin/win-sudo && mkdir -pv ~/bin/win-sudo && cd "$_";init-gitrepo-setup && gramf https://github.com/imachug/win-sudo.git && git pull -q base master
for f in ~/.bashrc ~/.bash_profile #/.profile leaving it out to avoid permission issues atleast in git bash
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
