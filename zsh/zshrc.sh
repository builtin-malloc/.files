################################################################################
## HISTORY #####################################################################
################################################################################

HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=5000

setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY

bindkey '^R' history-incremental-search-backward

################################################################################
## PROMPT ######################################################################
################################################################################

ICON_FOLDER=""
ICON_COMPUTER="󱩛"
ICON_GIT=""

function git_branch {
  local branch
  branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
  [[ -n "$branch" ]] && echo "$ICON_GIT: $branch"
}

function precmd {
  local exit_code=$?

  PROMPT=$'\n'
  PROMPT+="---( $ICON_FOLDER  %~ )--- "
  PROMPT+="---( $ICON_COMPUTER  %n@%m )--- "

  local branch=$(git_branch)
  [[ -n "$branch" ]] && PROMPT+="---( $branch )--- "

  PROMPT+="---( $exit_code )---"$'\n'
  PROMPT+='$ '
}

################################################################################
## COMPLETIONS #################################################################
################################################################################

autoload -Uz compinit
compinit

if [[ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
  source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi


if [[ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
  source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

eval "$(zoxide init zsh)"

################################################################################
## ALIASES #####################################################################
################################################################################

alias ls='eza --color=auto --group-directories-first'
alias cat='batcat --paging=never'
alias grep='rg'
alias top='btop'
alias cd='z'

################################################################################
## COLORS ######################################################################
################################################################################

export TERM=xterm-256color
export COLORTERM=truecolor
