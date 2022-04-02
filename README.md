# [42-tools](https://hub.docker.com/r/ycornamusaz/42-tools)

Container based on debian 11 with tools to compile and correct projects from [@42lausanne](https://www.42lausanne.ch/) school.

Feel free to open PR/Issue :)

## Features

#### What's included :

* build-essential & gdb/lldb
* man pages
* vim
* valgrind
* norminette

## How to use

Container lauch in rootless mode, with the uid 1000 (username: `42`).

The 42 user's home is in `/42-user/`, feel free to mount your config files in this directory (read-only mode is recommended).

Actual workdir is set as `/project`, you can mount your project directory in this one. 

To launch the container, you can run the following command :

```
docker run -it --rm -v $(pwd):/project -v ~/.vimrc:/42-user/.vimrc:ro -v ~/.vim/:/42-user/.vim:ro ycornamusaz/42-tools
```

This will mount your current directory into /project and also link your vim configuration files.

### Tips

You can add the following line to your .bashrc/.zshrc configuration file to be able to launch the container with the command `42tools`.

```
alias 42tools="docker run -it --rm -v $(pwd):/project -v ~/.vimrc:/42-user/.vimrc:ro -v ~/.vim/:/42-user/.vim:ro ycornamusaz/42-tools"
```

### TODO

* Cleaner Dockerfile
* Github action pipeline triggered by webhooks on norminette & debian container base update
* ...
