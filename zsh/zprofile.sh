export PATH="/opt/homebrew/bin:$PATH"
export PATH="/snap/bin:$PATH"
export PATH="$HOME/Programs/lua-language-server/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/VirtualEnvs/Global/bin:$PATH"

export EDITOR=nvim
export VISUAL=nvim
export PAGER=less

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

if command -v brew >/dev/null 2>&1; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if command -v python3.12 >/dev/null 2>&1; then
  alias python=python3.12
fi
