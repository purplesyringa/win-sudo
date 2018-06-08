#!/usr/bin/env bash
source <(curl -s https://raw.githubusercontent.com/imachug/win-sudo/s/aliases.sh)
echo "Downloading win-sudo...";trap 'echo "Failed to install, sorry :(";exit 1' ERR
mkdir -p ~/bin/win-sudo && cd "$_";git init -q && git config core.sparsecheckout true;echo s/ >> .git/info/sparse-checkout
gramf https://github.com/imachug/win-sudo.git && git pull -q base master
echo "source ~/bin/win-sudo/s/path.sh" | tee -a ~/.bashrc ~/.bash_profile /etc/profile >/dev/null 2>&1
echo "source ~/bin/win-sudo/s/aliases.sh" >>~/.bashrc
echo "Win-sudo successfully installed!";exec bash
