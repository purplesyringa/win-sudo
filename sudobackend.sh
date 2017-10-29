cd "$2"

fifoid=$1

command_to_run=$(cat "$fifoid.command")
rm "$fifoid.command"

frontend=$(cat "$fifoid.fd")
rm "$fifoid.fd"

($command_to_run) >"$frontend/1" 2>"$frontend/2" <"$frontend/0" &
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