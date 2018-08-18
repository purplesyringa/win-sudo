#!/usr/bin/env bash
curl -s https://raw.githubusercontent.com/DemonixCraft/win-sudo/master/installaliases.sh && . ./installaliases.sh
ws-start-script
mkdir -pv ~/bin/win-sudo && cd "$_";init-gitrepo-setup && gramf https://github.com/imachug/win-sudo.git && git pull -q base master
echo "source ~/bin/win-sudo/s/path.sh" | tee -a ws-files null && echo "source ~/bin/win-sudo/s/aliases" >>~/.bashrc
ws-success
