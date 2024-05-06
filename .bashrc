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
# export GTK_THEME=damn
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
export PGDATA="$HOME/postgres_data"
export PGHOST="/tmp"

# Add JBang to environment
alias j!=jbang
export PATH="$HOME/.jbang/bin:$HOME/.jbang/currentjdk/bin:$PATH"
export JAVA_HOME=$HOME/.jbang/currentjdk
export DB_USERNAME=coni

export EWW_BAR=bar-2
PS1='\[\033]0;\u@\w:\w\007\]\[\033[01;31m\]\u@\h\[\033[01;34m\] \w \n$\[\033[00m\] '
alias mbison="bison --report=all -d  -Wcounterexamples"
alias tigrou="cd /home/coni/dev/epita/tigrou/"
# alias ls="ffmpeg -y -f video4linux2 -i /dev/video0 -vframes 1  -video_size 640x480 /home/coni/$RANDOM.png  2> /dev/null; xdg-open $RANDOM ; ls --color=auto"
export PGDATA="$HOME/postgres_data"
export PGHOST="/tmp"
