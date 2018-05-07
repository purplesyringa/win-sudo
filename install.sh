#!/usr/bin/env bash
function doInstall {
	TMP_DIR=/tmp/win-sudo
	if ! [ -d "${TMP_DIR}" ]; then
		git -c advice.detachedHead=false clone https://github.com/imachug/win-sudo.git --depth=1 "${TMP_DIR}"
	fi
	"${TMP_DIR}/sudo" cp "${TMP_DIR}/su*" /usr/bin/ "&&" rm -rf "${TMP_DIR}"
}

function doFail {
	echo "failed to install, sorry :'(";
	exit 1
}
doInstall || doFail
echo "enjoy :)"
