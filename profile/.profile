EDITOR=nvim
XINITRC=/home/dagal/.config/X11/xinitrc
PATH=/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin
PATH=$PATH:/opt/metasploit-framework/bin:/opt/texlive/2022/bin/x86_64-linux
PATH=$PATH:$HOME/.local/scripts:$HOME/.local/bin:$HOME/go/bin:$HOME/.cargo/bin

pgrep Xorg >/dev/null || startx $XINITRC

# if [ "$TMUX" = "" ]; then
#     tmux
# fi
. "$HOME/.secrets"

if [ -z "$ZELLIJ" ]; then
    if [ "$ZELLIJ_AUTO_ATTACH" = "true" ]; then
        zellij attach -c
    else
        zellij options --theme gruvbox-dark
    fi

    if [ "$ZELLIJ_AUTO_EXIT" = "true" ]; then
        exit
    fi
fi
