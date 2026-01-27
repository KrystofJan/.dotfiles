# Core ZSH Configuration
# This file contains only the base zsh configuration.
# Module-specific configurations are added via home-manager modules.

# Use vi keybindings
bindkey -v

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

# Add zsh functions directory to fpath
fpath+=${ZDOTDIR:-~}/.zsh_functions

# General aliases
alias c=clear
alias v=nvim

# Environment variables
export MANPAGER='nvim +Man!'
export LC_TIME=en_US.UTF-8

# Tmux sessionizer function
sesh() {
  "$HOME/.dotfiles/tmux-sessionizer" "$1"
}

# Source local environment variables if they exist
[ -f "$HOME/.dotfiles/.env" ] && source "$HOME/.dotfiles/.env"

# Display hostname banner
echo "$HOST" | figlet -f ~/.dotfiles/Bloody.flf -w $(tput cols) -c

