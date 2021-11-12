#
# ~/.bash_profile
#
[[ -f ~/.bashrc ]] && . ~/.bashrc

if [ -f "/usr/bin/random-lyrics" ] || [ -f "$HOME/.local/bin/random-lyrics" ];
then
random-lyrics $HOME/.config/random-lyrics/ 700
fi

startx > /dev/null 2>&1