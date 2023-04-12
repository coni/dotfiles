# clock
hwclock --systohc

# Language Symbol
echo fr_FR.UTF-8 UTF-8 >> /etc/locale.gen
echo zh_CN.UTF-8 UTF-8 >> /etc/locale.gen
echo en_US.UTF-8 UTF-8 >> /etc/locale.gen
echo ko_KR.UTF-8 UTF-8 >> /etc/locale.gen
echo jp_JP.UTF-8 UTF-8 >> /etc/locale.gen
locale-gen

# System Language
echo LANG=en_US.UTF-8 >> /etc/locale.conf

# Keyboard Layout
echo KEYMAP=fr >> /etc/vconsole.conf

# Hostname
echo radvx > /etc/hostname

# hosts file
echo 127.0.0.1 localhost >> /etc/hosts
echo ::1 localhost >> /etc/hosts

# compiling kernel
mkinitcpio -P

# user password
passwd
