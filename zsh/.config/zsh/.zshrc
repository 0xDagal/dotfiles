source "$HOME/.profile"
source "$HOME/.cache/wal/colors.sh"
autoload -Uz compinit promptinit

# Completion
compinit
zstyle ':completion:*' rehash true
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# Styling
promptinit
eval "$(starship init zsh)"
(cat ~/.cache/wal/sequences &)

# Keybinding
bindkey -v
#source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# Man pages
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'
export LESS_TERMCAP_us=$'\e[1;4;31m'
