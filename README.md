# zsh_files
Various files that make my life in the terminal easier

### .gitignore_global
A global gitignore

`git config --global core.excludesfile absolute_path_to_/.gitignore_global`

Ignores
* .DS_Store
* .pyc
* .tsc

### .zshenv
A replacement .zshenv

`ln -s absolute_path_to_/.zshenv ~/.zshenv`

* Adds to $PATH
* Sets various useful environment variables
* Sources ~/.local_envvars

### .zshrc
A replacement .zshrc

`ln -s absolute_path_to_/.zshrc ~/.zshrc`

* Autoloads vcs_info
* `eval "$(jenv init -)"` if jenv installed
* Loads zsh_prompt.zsh

### zsh_prompt.zsh
An enhanced prompt that I stole from a coworker, enhanced, then ported from bash to zsh.
> source absolute_path_to_/.zsh_prompt.zsh (only needed if you don't use the .zshrc above)
* Shows current git branch and status (if any) via color
* Shows status of last run command
* Shows date/time
* Shows current working directory
* Shows current user
* Shows current host
