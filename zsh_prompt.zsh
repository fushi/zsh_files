setopt prompt_subst

# Define colors
RESET='%f'
FGBK='%F{0}' # foreground black
FGRD='%F{1}' # foreground red
FGGN='%F{2}' # foreground green
FGYL='%F{3}' # foreground yellow
FGBL='%F{4}' # foreground blue
FGMG='%F{5}' # foreground magenta
FGCY='%F{6}' # foreground cyan
FGGR='%F{7}' # foreground gray
FGBKBD='%F{8}' # foreground black bright
FGRDBD='%F{9}' # foreground red bright
FGGNBD='%F{10}' # foreground green bright
FGYLBD='%F{11}' # foreground yellow bright
FGBLBD='%F{12}' # foreground blue bright
FGMGBD='%F{13}' # foreground magenta bright
FGCYBD='%F{14}' # foreground cyan bright
FGGRBD='%F{15}' # foreground gray bright
BGBK='%k{0}' # background black
BGRD='%k{1}' # background red
BGGN='%k{2}' # background green
BGYL='%k{3}' # background yellow
BGBL='%k{4}' # background blue
BGMG='%k{5}' # background magenta
BGCY='%k{6}' # background cyan
BGGR='%k{7}' # background gray

# Detect whether the current directory is a git repository.
function is_git_repository {
  git branch > /dev/null 2>&1
}

precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
zstyle ':vcs_info:git:*' formats '[%b]'
zstyle ':vcs_info:*' enable git

# Determine the branch/state information for this git repository.
function set_git_branch {
  # Capture the output of the "git status" command.
  git_status="$(git status 2> /dev/null)"

  # Set color based on clean/staged/dirty.
  if [[ ${git_status} =~ "working tree clean" ]]; then
    state=$FGGN
  elif [[ ${git_status} =~ "Changes to be committed" ]]; then
    state=$FGYLBD
  else
    state=$FGRD
  fi

  # Set arrow icon based on status against remote.
  remote_pattern="Your branch is up to date"
  if [[ ${git_status} =~ "Your branch is up to date" ]]; then
    remote=""
  elif [[ ${git_status} =~ "Your branch is ahead" ]]; then
    remote="↑"
  elif [[ ${git_status} =~ "Your branch is behind" ]]; then
    remote="↓"
  elif [[ ${git_status} =~ "Your branch and .* have diverged" ]]; then
    remote="↕"
  fi

  # Set the final branch string.
  if is_git_repository ; then
    BRANCH="${state}${vcs_info_msg_0_}${remote}$RESET"
  else
    BRANCH=''
  fi
}

precmd() {
  set_git_branch
  RPROMPT="$BRANCH"
}

preexec() {
  date
}

# Set PROMPT_SYMBOL
PROMPT_SYMBOL="%(?.(%?) ⌘.$FGRD%?$RESET ⌘)"

PROMPT="$FGGR%n@$HOSTCOLOR%m$RESET $FGGR%~$RESET ${PROMPT_SYMBOL} "
