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

function set_prompt() {
  local EXIT_STATUS=$?
  local GIT_BRANCH=""
  
  if command -v git >/dev/null 2>&1; then
    GIT_BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    [[ -n "$GIT_BRANCH" ]] && GIT_BRANCH="---( git:${GIT_BRANCH} )---"
  fi

  echo

  PROMPT="---( %n )--- ---( %~ )--- ---( $EXIT_STATUS )--- $GIT_BRANCH"$'\n''%# '
}

if ! [[ " ${precmd_functions[@]} " =~ " set_prompt " ]]; then
  precmd_functions+=(set_prompt)
fi

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
