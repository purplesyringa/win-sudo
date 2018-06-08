#!/usr/bin/env bash
shopt -s expand_aliases
alias gramf="git remote add -mf base"
alias ws-success='echo "Win-sudo successfully installed!";exec bash'
alias ws-script-start='echo "Downloading win-sudo...";trap 'echo "Failed to install, sorry :(";exit 1' ERR'
alias ws-files="~/.bashrc ~/.bash_profile /etc/profile"
alias null=">/dev/null 2>&1"
