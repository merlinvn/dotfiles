#!/bin/bash

sudo cat "options hid_apple fnmode=2" > /etc/modprobe.d/hid_apple.conf
#sudo cat "options hid_apple swap_opt_cmd=1" >> /etc/modprobe.d/hid_apple.conf
sudo cat "options hid_apple swap_fn_leftctrl=1" >> /etc/modprobe.d/hid_apple.conf



sudo mkinitcpio -p linux
