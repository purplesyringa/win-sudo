# win-sudo

> If we open msysgit as administrator, we can use it as if we were root.
> However, it is often easier to open without administrator privileges.

> Well, Git comes with Bash emulator and you can use *nix commands. "sudo" and "apt-get" are not such - there are tools, programs if you like which obviously you don't have.

Say no to these problems! Install `win-sudo` and use `sudo` and `su` as on Linux.

No more "Why must I open context menu and use a separate window?" questions.

![screenshot](img/screenshot.gif)

## Installation

```bash
$ cd ~/bin
$ git clone https://github.com/imachug/win-sudo.git
```

## Usage

### sudo

`sudo` command accepts path to program and then argument list.

```bash
$ sudo pip install gevent
Collecting gevent...
```

You will be asked for UAC acception (if it is enabled) and then a new session will be opened as a sub-shell.

### su

`su` accepts no arguments and runs bash shell. You can exit by typing `exit`.

```bash
$ su
# exit
$
```

## Known issues

Some windows commands (such as `cmd`) don't work fine. So:

```bash
$ sudo cmd
Microsoft Windows [Version 10.0.15036]
(c) Microsoft Corporation, 2017. All right reserved.

C:\Users\Ivanq>echo 1 <--
echo 1 <--
1

C:\Users\Ivanq>
```

THe command is prompted twice. Though the same happens when calling just `cmd`, not `sudo cmd`.

To fix this, run `sudo winpty cmd` instead. (but you will have to run `sudo winpty cmd //c "echo 1"` instead of `sudo cmd /c "echo 1"`)
