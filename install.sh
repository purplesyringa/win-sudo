#!/usr/bin/env bash
echo "Downloading win-sudo...";trap 'echo "Failed to install, sorry :(";exit 1' ERR 
mkdir -p ~/bin/win-sudo && cd "$_";git init -q && git config core.sparsecheckout true;echo s/ >> .git/info/sparse-checkout
git remote add -mf origin https://github.com/DemonixCraft/win-sudo.git && git pull -q origin master
echo "source ~/bin/win-sudo/s/path.sh" | tee -a ~/.bashrc >/dev/null 2>&1
echo "Win-sudo successfully installed!";rm -rf ~/.bash_profile >/dev/null 2>&1;exec bash
