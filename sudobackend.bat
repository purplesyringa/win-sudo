@echo off
cd %2

set fifoid=%1

set bash_fifoid=/%fifoid%
set bash_fifoid=%bash_fifoid:\=/%
set bash_fifoid=%bash_fifoid::=%

<"%fifoid%.command" set /p command_to_run=
del "%fifoid%.command"

<"%fifoid%.bash" set /p bash_path=
del "%fifoid%.bash"

<"%fifoid%.fd" set /p frontend=
del "%fifoid%.fd"

"%bash_path%" -c "(%command_to_run%) >%frontend%/1 2>%frontend%/2 <%frontend%/0 & echo $! | tee %bash_fifoid%.pidf >%bash_fifoid%.pid && wait $(cat %bash_fifoid%.pid)"
"%bash_path%" -c "echo 1 >%bash_fifoid%.finish"