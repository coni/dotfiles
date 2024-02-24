#
# ~/.bashrc
#

# If not running interactively, don't do anything

# cat $HOME/.config/termColor/default

export PATH="/home/coni/Downloads/platform-tools/:$PATH:$HOME/.local/bin/:$HOME/.local/bin/platform-tools/"
# export LANG=en_US.UTF-8
export LANG=en_US.UTF-8
export NNN_OPTS="H"
export NNN_PLUG='h:preview-tabbed;i:renamer;c:cdpath;a:autojump'
export _JAVA_AWT_WM_NONREPARENTING=1
export GTK_THEME=rose-pine-dawn-gtk
export EDITOR=vim

if [ -f "$HOME/.bash/aliases" ];then
    source $HOME/.bash/aliases
fi

if [ -f "$HOME/.bash/aliases_epita" ];then
    source $HOME/.bash/aliases_epita
fi

if [ -f "$HOME/.bash/aliases_pm" ];then
    source $HOME/.bash/aliases_pm
fi

[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='\[\033]0;\u@\h:\w\007\]\[\033[01;31m\]\u@\h\[\033[01;34m\] \w \n$\[\033[00m\] '
export PGDATA="$HOME/postgres_data"
export PGHOST="/tmp"

# Add JBang to environment
alias j!=jbang
export PATH="$HOME/.jbang/bin:$HOME/.jbang/currentjdk/bin:$PATH"
export JAVA_HOME=$HOME/.jbang/currentjdk
export DB_USERNAME=coni
