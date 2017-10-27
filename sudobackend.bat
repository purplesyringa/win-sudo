@echo off
cd %~dp0

set fifoid=%1
<"%fifoid%.command" set /p command_to_run=
del "%fifoid%.command"

title Git Bash: sudo
mode con cols=80 lines=1
set /p _="%command_to_run%"<nul

<"%fifoid%.bash" set /p bash_path=
del "%fifoid%.bash"

<"%fifoid%.tty" set /p frontend_tty=
del "%fifoid%.tty"

"%bash_path%" -c "(%command_to_run%) >%frontend_tty% 2>&1 <%frontend_tty%"
"%bash_path%" -c "echo 1 >%fifoid%.finish"