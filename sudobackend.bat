@echo off
cd %~dp0

set fifoid=%~dp0%1

set bash_fifoid=/%fifoid%
set bash_fifoid=%bash_fifoid:\=/%
set bash_fifoid=%bash_fifoid::=%

<"%fifoid%.command" set /p command_to_run=
del "%fifoid%.command"

<"%fifoid%.bash" set /p bash_path=
del "%fifoid%.bash"

<"%fifoid%.tty" set /p frontend_tty=
del "%fifoid%.tty"

"%bash_path%" -c "(%command_to_run%) >%frontend_tty% 2>&1 <%frontend_tty%"
"%bash_path%" -c "echo 1 >%bash_fifoid%.finish"