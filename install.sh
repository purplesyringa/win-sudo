#!/usr/bin/env bash
function doInstall {
    if ! [ -L ~/bin ] && ! [ -d ~/bin ]; then
        echo make dir
        mkdir ~/bin
    else
        echo dir '~/bin' exist
    fi
    cd /tmp && \
    git clone https://github.com/imachug/win-sudo.git && \
    mv win-sudo/sudo ~/bin && \
    mv win-sudo/su ~/bin && \
    rm -rf win-sudo
}

function doFail {
echo "failed to install, sorry :'(";
 exit 1
}
doInstall || doFail
echo "enjoy :)"
