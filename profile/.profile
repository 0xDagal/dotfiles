EDITOR=vim
XINITRC=/home/dagal/.config/X11/xinitrc
XDG_RUNTIME_DIR=/run/user/1000
PATH=/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin
PATH=$PATH:/opt/metasploit-framework/bin:/opt/texlive/2022/bin/x86_64-linux
PATH=$PATH:$HOME/.local/scripts:$HOME/.local/bin:$HOME/go/bin:$HOME/.cargo/bin

pgrep Xorg >/dev/null || startx $XINITRC

if [ "$TMUX" = "" ]; then
    tmux
fi
