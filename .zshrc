# `.zshrc' is sourced in interactive shells.
# It should contain commands to set up aliases, functions, options, key bindings, etc.

# vcsinfo
autoload -Uz vcs_info

# jenv
if command -v jenv 1> /dev/null
then
    eval "$(jenv init -)"
fi

# Load custom zsh prompt
source $ZSH_FILES_DIR/zsh_prompt.zsh

# Load script aliases
for f in ${PERSONAL_SOURCE}/scripts/*.sh ~/local_scripts/*.sh
do
    f=`basename $f`
    alias "${f%.*}"="${f}"
done
