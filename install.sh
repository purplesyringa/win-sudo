#!/usr/bin/env bash
shopt -s expand_aliases
cat <(curl -s https://raw.githubusercontent.com/DemonixCraft/win-sudo/master/installaliases) >> ~/.bashrc && . ~/.bashrc
ws-start-script
mkdir -p ~/bin/win-sudo && cd "$_";git init -q && git config core.sparsecheckout true;echo s/ >> .git/info/sparse-checkout
gramf https://github.com/imachug/win-sudo.git && git pull -q base master
echo "source ~/bin/win-sudo/s/path.sh" | tee -a ws-files null
echo "source ~/bin/win-sudo/s/aliases.sh" >>~/.bashrc
ws-success
