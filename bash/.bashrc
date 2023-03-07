#!/bin/bash
source "$HOME/.profile"
source "$HOME/.bash_aliases"
# package bash-completion in most distros
if [[ -f /usr/share/bash-completion/bash_completion ]]; then
    source /usr/share/bash-completion/bash_completion
fi

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=5000
HISTFILESIZE=10000
HISTCONTROL=erasedups

# Shopt options
shopt -s autocd # auto cd when entering a path
shopt -s histappend # history to file

bind 'set completion-ignore-case on'
# Faster completion
bind 'set show-all-if-ambiguous on'

# Vi / VIm ❤️
set -o vi

git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
PROMPT_DIRTRIM=2 # Only show parent directory/current directory when using \w
GREEN='\[\033[32m\]'
RED='\[\033[31m\]'
YELLOW='\[\033[33m\]'
NORMAL='\[\033[0m\]'
PS1="${GREEN}\w${RED}$(git_branch)${YELLOW}\$${NORMAL} "
