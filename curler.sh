#!/usr/bin/env bash
function curl {
	curl -s https://raw.githubusercontent.com/DemonixCraft/win-sudo/master/install.sh | sh
}
function curlfail {
  echo "Curl failed...check your connection to the network"
  exit 1
}
curl | | curlfail
