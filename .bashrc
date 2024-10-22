#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
# PS1='[\u@\h \W]\$ '
PS1='\n\[\e[34m\]┌──(\[\e[97;1m\]\u\[\e[97m\]@\[\e[97m\]\h\[\e[0;34m\])-[\[\e[97m\]\w\[\e[0;34m\]] \n\[\e[34m\]╰─\[\e[97;1m\]\$\[\e[0m\] '

. "$HOME/.cargo/env"

export PATH="$HOME/.local/bin:$PATH"
export _JAVA_AWT_WM_NONREPARENTING=1

alias wm="dwl -s 'bash $HOME/.config/dwl/autostart.sh  <&-'"
alias gtktheme="gsettings set org.gnome.desktop.interface"

export EDITOR="vim"
alias se="sudoedit"
alias monitor="wlr-randr --output eDP-1 --pos 1920,1080 --output DP-2 --mode 3840x2160@120 --pos 1920,0 --scale 2 --output HDMI-A-1 --pos  0,185"
