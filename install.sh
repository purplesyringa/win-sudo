#!/usr/bin/env bash
echo "Downloading win-sudo..."

# Set error handler
trap "echo Failed to install, sorry :(; exit 1" ERR

# Clean default install dir
if [ -d ~/bin/win-sudo ] ; then
	echo "Cleaning ~/bin/win-sudo..."
	rm -rfv ~/bin/win-sudo
fi

# Download latest sources to a fresh directory 
mkdir -pv ~/bin/win-sudo
cd "$_"
git init -q
git config core.sparsecheckout true
echo s/ >>.git/info/sparse-checkout
git remote add -mf base https://github.com/imachug/win-sudo.git
git pull -q base master

# Start processing bash initialization files
# We're leaving out /.profile to avoid permission issues (at least in Git Bash)
touch ~/.bashrc
for f in ~/.bashrc ~/.bash_profile
do
	echo "Processing $f"
	if [ -f $f ] ; then
		if grep -q "source ~/bin/win-sudo/s/path.sh" $f ; then
			echo "Sudo initialization already in file " $f
			break
		else
			echo "Appending sudo initialization to " $f
			echo "[ -f ~/bin/win-sudo/s/path.sh ] && source ~/bin/win-sudo/s/path.sh" >>$f
			break
		fi
	fi
done

echo "Win-sudo successfully installed!"
exec bash
