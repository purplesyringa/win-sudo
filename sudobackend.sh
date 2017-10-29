cd "$2"

fifoid=$1

command_to_run=$(cat "$fifoid.command")
rm "$fifoid.command"

frontend=$(cat "$fifoid.fd")
rm "$fifoid.fd"

($command_to_run) >"$frontend/1" 2>"$frontend/2" <"$frontend/0" &
pid=$!
echo $pid >"$fifoid.pidf"

wait $pid
echo 1 >"$fifoid.finish"