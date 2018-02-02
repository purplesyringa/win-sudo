# win-sudo

> If we open msysgit as administrator, we can use it as if we were root.
> However, it is often easier to open without administrator privileges.

> Well, Git comes with Bash emulator and you can use *nix commands. "sudo" and "apt-get" are not such - there are tools, programs if you like which obviously you don't have.

Say no to these problems! Install `win-sudo` and use `sudo` and `su` as on Linux.

No more "Why must I open context menu and use a separate window?" questions.

![screenshot](img/screenshot.gif)

## Installation

```
curl -s https://raw.githubusercontent.com/imachug/win-sudo/master/install.sh | sh
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

## Why win-sudo?

1. No need for installation: download and use.
2. Native: no Go, Python, etc.
3. Open-source: no viruses.
4. Small: easy to contribute and understand.

## Known issues

### winpty

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

The command is prompted twice. Though the same happens when calling just `cmd`, not `sudo cmd`.

To fix this, run `sudo winpty cmd` instead. (but you will have to run `sudo winpty cmd //c "echo 1"` instead of `sudo cmd /c "echo 1"`)

### Job support

`win-sudo` doesn't support jobs, so when running `su` or `sudo bash` you may get:

```
bash: cannot set terminal process group (7152): Operation not permitted
bash: no job control in this shell
```

This is harmless, so you can ignore this warning.
