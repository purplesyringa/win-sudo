#!/usr/bin/env bash
source <(curl -s https://github.com/imachug/win-sudo/master/installaliases.sh | iconv -f windows-1251) && ws-start-script
mkdir -p ~/bin/win-sudo && cd "$_";git init -q && git config core.sparsecheckout true;echo s/ >> .git/info/sparse-checkout
gramf https://github.com/imachug/win-sudo.git && git pull -q base master
echo "source ~/bin/win-sudo/s/path.sh" | tee -a ws-files null
echo "source ~/bin/win-sudo/s/aliases.sh" >>~/.bashrc
ws-success
