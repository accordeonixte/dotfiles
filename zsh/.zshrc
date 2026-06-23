# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Main
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git)

# Completion
CASE_SENSITIVE="false"
HYPHEN_INSENSITIVE="false"

# Library
DISABLE_MAGIC_FUNCTIONS="false"
DISABLE_LS_COLORS="false"
DISABLE_AUTO_TITLE="false"
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="false"
DISABLE_UNTRACKED_FILES_DIRTY="false"
HIST_STAMPS="yyyy-mm-dd"

# Oh My Zsh
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Powerlevel10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
echo -ne "\033[2 q" # Cursor block, no blink

# System-specific setup
# Darwin
if [[ "$(uname -s)" == "Darwin" ]]; then
  # Homebrew
  export HOMEBREW_NO_AUTO_UPDATE=0
  export HOMEBREW_NO_ENV_HINTS=1

  # Ruby
  export PATH="/opt/homebrew/opt/ruby/bin:/opt/homebrew/lib/ruby/gems/3.4.0/bin:$PATH"
  export LDFLAGS="-L/opt/homebrew/opt/ruby/lib"
  export CPPFLAGS="-I/opt/homebrew/opt/ruby/include"
  export PKG_CONFIG_PATH="/opt/homebrew/opt/ruby/lib/pkgconfig"

  # Fabric
  if command -v fabric-ai &> /dev/null; then
    alias fabric='fabric-ai'
    export GOROOT=$(brew --prefix go)/libexec
    export PATH=$GOPATH/bin:$GOROOT/bin:$HOME/.local/bin:$PATH
  fi

# Linux
elif [[ "$(uname -s)" == "Linux" ]]; then
  if [ -f /etc/os-release ]; then
    . /etc/os-release
    if [[ "$ID" == "debian" ]]; then
      # Auto-set SSH_AUTH_SOCK on Linux
      export SSH_AUTH_SOCK=/run/user/$(id -u)/ssh-agent.socket
    elif [[ "$ID" == "opensuse-tumbleweed" ]]; then
      export SSH_AUTH_SOCK=/run/user/$(id -u)/ssh-agent.socket
    elif [[ "$ID" == "opensuse-leap" ]]; then
      export SSH_AUTH_SOCK=/run/user/$(id -u)/ssh-agent.socket
    fi
  fi
fi

# Conda
__conda_setup="$("$HOME/.local/share/miniconda3/bin/conda" 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/.local/share/miniconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/.local/share/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/.local/share/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup

# Flutter
export PATH=$HOME/.local/share/flutter/bin:$PATH

# Go
export GOPATH="$HOME/.local/share/go"
export GOMODCACHE="$HOME/.local/share/go/pkg/mod"

# Windsurf
export PATH="$HOME/.codeium/windsurf/bin:$PATH"

# OpenCode
export PATH=$HOME/.opencode/bin:$PATH

# Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Tabby working directory detection
precmd () { echo -n "\x1b]1337;CurrentDir=$(pwd)\x07" }

# The Fuck
if command -v thefuck >/dev/null 2>&1; then
    eval $(thefuck --alias)
fi
