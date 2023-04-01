#
# ~/.bashrc
#

# If not running interactively, don't do anything

# cat $HOME/.config/termColor/default

export PATH=$PATH:$HOME/.local/bin/:$HOME/.local/bin/platform-tools/
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export NNN_OPTS="H"
export EDITOR="nvim"
export NNN_PLUG='h:preview-tabbed;i:renamer;c:cdpath;a:autojump'
#export XSECURELOCK_SAVER=$HOME/.config/dwm/lockscreen.sh
export XSECURELOCK_FONT=azukifontB:size=30
export _JAVA_AWT_WM_NONREPARENTING=1

if [ -f "$HOME/.bash_aliases" ];then
    source $HOME/.bash_aliases
fi

[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
