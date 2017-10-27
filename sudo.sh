#!/bin/bash
command_to_run="$*"
if [ -z "$command_to_run" ]; then
	echo "Usage: sudo command"
	echo "Runs command with administrator privileges."
	exit
fi

backend="$(realpath $(dirname $0))/sudobackend.bat"
frontend_tty=$(tty)

fifoid=".sudo.$RANDOM"

echo "$command_to_run">"$fifoid.command"
echo "$frontend_tty">"$fifoid.tty"

# Get bash path
pushd / >/dev/null 2>&1
bash_path="$(pwd -W)bin/sh"
popd >/dev/null 2>&1
echo "$bash_path" >"$fifoid.bash"

# Run command
read -p "Login: " user_login
winpty runas //profile //user:"$user_login" "\"$backend\" $fifoid"