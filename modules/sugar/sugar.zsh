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
