# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/coni/.zshrc'

autoload -Uz compinit
compinit

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

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
PROMPT="%F{red}%n%f%F{red}@%f%F{red}%m%f %F{blue}%~%f%F{blue} $ %f"
RPROMPT="%T"
