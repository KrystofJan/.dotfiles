# Use emacs keybindings even if our EDITOR is set to vi
bindkey -v

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

# ---- FZF -----

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

# -- Use fd instead of fzf --
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}


# bat
export BAT_THEME=gruvbox-dark
alias cat="bat"


# eza
alias ls="eza --color=always --long --git --icons=always --no-time --no-user --no-permissions"
alias ll="eza --color=always --long --git --icons=always"

# ---- Zoxide (better cd) ----
eval "$(zoxide init zsh)"
alias cd="z"

source ~/fzf-git.sh/fzf-git.sh


# Atuin
eval "$(atuin init zsh)"

alias lg="lazygit"
alias ldoc="lazydocker"

fpath+=${ZDOTDIR:-~}/.zsh_functions

alias zl="zellij"

bindkey -r '^T'
bindkey '^F' fzf-file-widget

# Created by `pipx` on 2024-05-21 05:43:57
export PATH="$PATH:/home/zahry/.local/share/"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(starship init zsh)"

alias ccu="~/work/corellium/cli-util/result/bin/ccu"
alias c=clear
alias v=nvim

export MANPAGER='nvim +Man!'

# Some yazi stuff
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

export LC_TIME=en_US.UTF-8

echo "$HOST" | figlet -f ~/.dotfiles/Bloody.flf -w $(tput cols) -c
