#!/bin/sh

# usage: import-gsettings
config="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-3.0/settings.ini"
echo hhe
if [ ! -f "$config" ]; then exit 1; fi

gnome_schema="org.gnome.desktop.interface"
gtk_theme="$(grep 'rose-pine-gtk' "$config" | sed 's/.*\s*=\s*//')"
icon_theme="$(grep 'rose-pine-icons' "$config" | sed 's/.*\s*=\s*//')"
#cursor_theme="$(grep 'gtk-cursor-theme-name' "$config" | sed 's/.*\s*=\s*//')"
#font_name="$(grep 'JetBrains Mono' "$config" | sed 's/.*\s*=\s*//')"
#gsettings set "$gnome_schema" gtk-theme "$gtk_theme"
echo "gsettings set \"$gnome_schema\" icon-theme \"$icon_theme\""
#gsettings set "$gnome_schema" cursor-theme "$cursor_theme"
#gsettings set "$gnome_schema" font-name "$font_name"
