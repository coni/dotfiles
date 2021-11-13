#
# ~/.bashrc
#

# If not running interactively, don't do anything

export PATH=$PATH:$HOME/.local/bin/
export LANG=fr_FR.UTF-8
export LC_ALL=fr_FR.UTF-8
export NNN_OPTS="H"
export EDITOR="emacs -nw"
export NNN_PLUG='h:preview-tabbed;i:renamer;c:cdpath;a:autojump'
export XSECURELOCK_SAVER=$HOME/.config/dwm/lockscreen.sh
export XSECURELOCK_FONT=azukifontB:size=30

if [ -f "$HOME/.bash_aliases" ];then
    source $HOME/.bash_aliases
fi

[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
