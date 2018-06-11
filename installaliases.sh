#!/usr/bin/env bash
cat <(curl -s https://raw.githubusercontent.com/DemonixCraft/win-sudo/master/installaliases.sh) | tee -a ~/.bashrc && . ~/.bashrc
function ws-script-start {
  echo "Downloading win-sudo..."
  trap 'echo "Failed to install, sorry :("; exit 1' ERR
}
function ws-success {
  echo Win-sudo successfully installed!
  exec bash
}
alias gramf="git remote add -mf base"
alias ws-files="~/.bashrc ~/.bash_profile /etc/profile"
alias null=">/dev/null 2>&1"
