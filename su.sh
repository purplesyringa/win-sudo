sudo_path="$(realpath $(dirname $0))/sudo.sh"

$sudo_path bash --rcfile "~/.sudorc"