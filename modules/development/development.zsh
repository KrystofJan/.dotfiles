# Development Module - ZSH Configuration
# Development tools and utilities

# ---- FZF -----
# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

# -- Use fd instead of fzf --
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Use fd for listing path candidates
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

# DISPLAY ENV VARIABLES
fzf_env() {
  env | fzf
}

zle -N fzf_env
bindkey '^E' fzf_env

# Rebind fzf file widget
bindkey -r '^T'
bindkey '^F' fzf-file-widget

# Source fzf-git.sh
source ~/fzf-git.sh/fzf-git.sh

# Lazygit and Lazydocker aliases
alias lg="lazygit"
alias ldoc="lazydocker"

