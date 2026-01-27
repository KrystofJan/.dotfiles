# Sugar Module - ZSH Configuration
# CLI enhancements and quality-of-life improvements

# bat - better cat
export BAT_THEME="Oldworld"
alias cat="bat"

# eza - better ls
alias ls="eza --color=always --long --git --icons=always --no-time --no-user --no-permissions"
alias ll="eza --color=always --long --git --icons=always"

# Zoxide - better cd
eval "$(zoxide init zsh)"
alias cd="z"

# Atuin - better history
eval "$(atuin init zsh)"

# Starship - better prompt
eval "$(starship init zsh)"

# Yazi - terminal file manager
# Function to change directory on exit
function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  IFS= read -r -d '' cwd < "$tmp"
  [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
  rm -f -- "$tmp"
}

