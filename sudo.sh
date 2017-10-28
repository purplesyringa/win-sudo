#!/bin/bash
command_to_run="$*"
if [ -z "$command_to_run" ]; then
	echo "Usage: sudo command"
	echo "Runs command with administrator privileges."
	exit
fi

# Convert to Windows path
backend="$(echo $(realpath $(dirname $0))/sudobackend.bat | sed -e 's/^\///' -e 's/\//\\/g' -e 's/^./\0:/')"
invisible="$(echo $(realpath $(dirname $0))/invisible.vbs | sed -e 's/^\///' -e 's/\//\\/g' -e 's/^./\0:/')"
frontend_tty=$(tty)

fifoid=".sudo.$RANDOM"
mkfifo "$fifoid.finish"

echo "$command_to_run">"$fifoid.command"
echo "$frontend_tty">"$fifoid.tty"

# Get bash path
pushd / >/dev/null 2>&1
bash_path="$(pwd -W)bin/sh"
popd >/dev/null 2>&1
echo "$bash_path" >"$fifoid.bash"

# Run command
read -p "Login: " user_login
winpty runas //profile //user:"$user_login" "wscript.exe \"$invisible\" \"$backend\" $fifoid"

# Wait
cat "$fifoid.finish" >/dev/null
rm "$fifoid.finish"