#!/usr/bin/env bash
echo "Downloading win-sudo..."

# Set error handler
trap "echo 'Failed to install, sorry :('; exit 1" ERR

# Clean default install dir
if [ -d "$HOME/bin/win-sudo" ] ; then
	echo "Cleaning $HOME/bin/win-sudo..."
	rm -rfv "$HOME/bin/win-sudo"
fi

# Download latest sources to a fresh directory 
mkdir -pv "$HOME/bin/win-sudo"
cd "$_"
git init -q
git config core.sparsecheckout true
echo s/ >>.git/info/sparse-checkout
git remote add -mf base https://github.com/imachug/win-sudo.git
git pull -q base master

# Start processing bash initialization files
# We're leaving out /.profile to avoid permission issues (at least in Git Bash)
touch "$HOME/.bashrc"
for f in "$HOME/.bashrc" "$HOME/.bash_profile"
do
	echo "Processing $f"
	if [ -f "$f" ] ; then
		if grep -q "source \"$HOME/bin/win-sudo/s/path.sh\"" "$f" ; then
			echo "Sudo initialization already in file " $f
			break
		else
			echo "Appending sudo initialization to " $f
			echo "[ -f \"$HOME/bin/win-sudo/s/path.sh\" ] && source \"$HOME/bin/win-sudo/s/path.sh\"" >>"$f"
			break
		fi
	fi
done

echo "Win-sudo successfully installed!"
exec bash
