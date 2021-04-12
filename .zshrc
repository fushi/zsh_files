# `.zshrc' is sourced in interactive shells.
# It should contain commands to set up aliases, functions, options, key bindings, etc.

# vcsinfo
autoload -Uz vcs_info

# jenv
if [[ $(which jenv 1> /dev/null) ]]; then
    eval "$(jenv init -)"
fi

# Load custom zsh prompt
source $ZSH_FILES_DIR/zsh_prompt.zsh
