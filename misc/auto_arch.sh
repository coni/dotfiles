hwclock --systohc
echo fr_FR.UTF-8 UTF-8 >> /etc/locale.gen
locale-gen
echo LANG=fr_FR.UTF-8 >> /etc/locale.conf
echo KEYMAP=fr >> /etc/vconsole.conf
echo coni >> /etc/hostname
echo 127.0.0.1 localhost >> /etc/hosts
echo ::1 localhost >> /etc/hosts
mkinitcpio -P
passwd
