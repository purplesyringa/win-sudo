#!/bin/bash
command_to_run="$*"
if [ -z "$command_to_run" ]; then
	echo "Usage: sudo command"
	echo "Runs command with administrator privileges."
	exit
fi

# Convert to Windows path
sudo_dir="$(realpath $(dirname $0))"
backend="$(echo $sudo_dir/sudobackend.bat | sed -e 's/^\///' -e 's/\//\\/g' -e 's/^./\0:/')"
invisible="$(echo $sudo_dir/invisible.vbs | sed -e 's/^\///' -e 's/\//\\/g' -e 's/^./\0:/')"
frontend_tty=$(tty)

fifoid="$sudo_dir/.sudo.$RANDOM"
win_fifoid="$(echo $fifoid | sed -e 's/^\///' -e 's/\//\\/g' -e 's/^./\0:/')"
mkfifo "$fifoid.finish"
mkfifo "$fifoid.pidf"

echo "$command_to_run">"$fifoid.command"
echo "$frontend_tty">"$fifoid.tty"

# Get bash path
pushd / >/dev/null 2>&1
bash_path="$(pwd -W)bin/sh"
popd >/dev/null 2>&1
echo "$bash_path" >"$fifoid.bash"

# Run command
powershell.exe Start-Process "$backend" "$win_fifoid" -Verb RunAs -WindowStyle Hidden 2>/dev/null
if [ $? -ne 0 ]; then
	echo "UAC elevation was canceled" >&2
	exit 1
fi

# Get pid
pid=$(cat "$fifoid.pidf")
rm "$fifoid.pidf"

# Bypass Ctrl+C
trap "kill -s SIGINT $pid" SIGINT

# Wait
while true; do
	res=$(cat "$fifoid.finish")
	if [ ! -z "$res" ]; then
		break
	fi
done

rm "$fifoid.finish"
rm "$fifoid.pid"