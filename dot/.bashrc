#
# ~/.bashrc
#

# If not running interactively, don't do anything

export PATH=$PATH:$HOME/.local/bin/
export LANG=fr_FR.UTF-8
export LC_ALL=fr_FR.UTF-8

if [ -f "$HOME/.bash_aliases" ];then
    source $HOME/.bash_aliases
fi

[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
