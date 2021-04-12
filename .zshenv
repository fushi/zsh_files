# `.zshenv' is sourced on all invocations of the shell, unless the -f option is set.
# It should contain commands to set the command search path, plus other important environment variables.
# `.zshenv' should not contain commands that produce output or assume the shell is attached to a tty.

ZSH_FILES_DIR=`dirname $(readlink ~/.zshenv)`

SOURCE_DIR=~/source
PERSONAL_SOURCE=$SOURCE_FOLDER/personal
THIRDPARTY_SOURCE=$SOURCE_FOLDER/thirdparty

# Source local environment variables
[[ -s ~/.local_envvars ]] && source ~/.local_envvars

# Put personal scripts in the path
PATH=$PERSONAL_SOURCE/scripts:$PATH

# Put the cwd in the path
PATH=.:$PATH

# MySQL 5.7 via `brew`
[[ -s /usr/local/opt/mysql@5.7/bin ]] && PATH=/usr/local/opt/mysql@5.7/bin:$PATH

# Maven 3.6.3
[[ -s /usr/local/apache-maven-3.6.3/bin ]] && PATH=/usr/local/apache-maven-3.6.3/bin:$PATH