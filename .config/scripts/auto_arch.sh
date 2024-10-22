hwclock --systohc

echo en_US.UTF-8 UTF-8 >> /etc/locale.gen
locale-gen

echo LANG=en_US.UTF-8 >> /etc/locale.conf

echo KEYMAP=us >> /etc/vconsole.conf

echo lin > /etc/hostname

echo 127.0.0.1 localhost >> /etc/hosts
echo ::1 localhost >> /etc/hosts

mkinitcpio -P

passwd
