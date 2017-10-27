@echo off
cd %~dp0

set fifoid=%1
<"%fifoid%.command" set /p command_to_run=
del "%fifoid%.command"

<"%fifoid%.bash" set /p bash_path=
del "%fifoid%.bash"

"%bash_path%" -c "%command_to_run%"

pause