cd "$2"

fifoid=$1

command_to_run=$(cat "$fifoid.command")
rm "$fifoid.command"

frontend=$(cat "$fifoid.fd")
rm "$fifoid.fd"

stdin=$(cat "$fifoid.stdin")
rm "$fifoid.stdin"

stdout=$(cat "$fifoid.stdout")
rm "$fifoid.stdout"

stderr=$(cat "$fifoid.stderr")
rm "$fifoid.stderr"

bash -c "$command_to_run" >"$stdout" 2>"$stderr" <"$stdin" &
pid=$!
echo $pid >"$fifoid.pidf"

while true; do
	sigint=$(cat "$fifoid.sigint")
	if [ ! -z "$sigint" ]; then
		if [ "$sigint" -eq 2 ]; then
			break
		fi
		kill -s SIGINT $pid
	fi
done &

wait $pid
echo 2 >"$fifoid.sigint"
echo 1 >"$fifoid.finish"