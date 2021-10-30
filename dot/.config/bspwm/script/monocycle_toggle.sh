if [ $(bspc config top_padding) == 0 ];
then
    bspc config top_padding 30
else
    bspc config top_padding 0
fi

bspc desktop -l next
