@echo off
cd %~dp0

set fifoid=%1
<"%fifoid%.command" set /p command_to_run=
del "%fifoid%.command"

<"%fifoid%.bash" set /p bash_path=
del "%fifoid%.bash"

<"%fifoid%.tty" set /p frontend_tty=
del "%fifoid%.tty"

"%bash_path%" -c "(%command_to_run%) >%frontend_tty% 2>&1"

pause