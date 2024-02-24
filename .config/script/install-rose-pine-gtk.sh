mkdir $HOME/.cache 2>/dev/null
curl -L https://github.com/rose-pine/gtk/releases/download/v2.1.0/gtk4.tar.gz -o $HOME/.cache/gtk4.tar.gz
tar xf $HOME/.cache/gtk4.tar.gz -C $HOME/.cache/
mkdir $HOME/.config/gtk-4.0/ 2> /dev/null
cp $HOME/.cache/gtk4/rose-pine.css $HOME/.config/gtk-4.0/gtk-4.0
rm -rf $HOME/.cache/gtk4/ $HOME/.cache/gtk4.tar.gz

curl -L https://github.com/rose-pine/gtk/releases/download/v2.1.0/gtk3.tar.gz -o $HOME/.cache/gtk3.tar.gz
tar xf $HOME/.cache/gtk3.tar.gz -C $HOME/.cache/
mkdir $HOME/.themes
cp -r $HOME/.cache/gtk3/rose-pine-gtk $HOME/.themes/
rm -rf $HOME/.cache/gtk3 $HOME/.cache/gtk3.tar.gz

gsettings set org.gnome.desktop.interface gtk-theme rose-pine-gtk
