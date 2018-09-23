#!/usr/bin/env bash
echo "Downloading win-sudo..."

# Set error handler
trap "echo Failed to install, sorry :(; exit 1" ERR

# Clean default install dir
if test -d ~/bin/win-sudo ; then
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
	if test -f $f ; then
		if grep -q "source ~/bin/win-sudo/s/path.sh" $f; then
			echo "Sudo initialization already in file " $f
			break
		else
			echo "Appending sudo initialization to " $f
			echo "source ~/bin/win-sudo/s/path.sh" | tee -a $f 
			break
		fi
	fi
done

source ~/bin/win-sudo/s/path.sh
echo "Win-sudo successfully installed!"
