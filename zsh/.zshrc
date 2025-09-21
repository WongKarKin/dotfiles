# XDG base directories.
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_PICTURES_DIR="$HOME/Pictures"
export XDG_STATE_HOME="$HOME/.local/state"

# Use neovim as the default editor.
export EDITOR=nvim
export VISUAL=nvim

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

export SSH_AUTH_SOCK="/tmp/ssh-XXXXXXFlIDoH/agent.6502"

export PATH="$PATH:/usr/local/bin:$HOME/.local/bin:$HOME/.cargo/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Stop Windows bell notification
setopt NO_BEEP

# For hyphen-insensitive completion
HYPHEN_INSENSITIVE="true"

zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# Set where the history file lives
HISTFILE=$HOME/.zsh_history

# How many lines of history to keep in memory
HISTSIZE=10000

# How many lines to keep in the history file
SAVEHIST=100000

# Options to improve usability
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS     # Don't store duplicates
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_REDUCE_BLANKS       # Remove superfluous blanks
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt SHARE_HISTORY            # Share history across sessions
setopt INC_APPEND_HISTORY       # Add history as commands are typed
setopt HIST_VERIFY              # Don't run expanded history immediately

bindkey '^p' history-search-backward
bindkey '^n' history-search-backward

plugins=(
	git
	zsh-autosuggestions
	zsh-syntax-highlighting 
	zsh-completions 
	fzf-tab 
	tmux
)

# Load Completions
autoload -U compinit && compinit

# Tmux auto-start settings
ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_AUTOSTART_SESSION="main"

source $ZSH/oh-my-zsh.sh

eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/powerlevel10k_rainbow.omp.json)"
eval "$(zoxide init zsh --cmd cd)"

# keychain config
eval $(keychain --eval githubrsakey)
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
  eval "$(ssh-agent -s)"
fi

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

cd $HOME
