sudo pacman -S linux-headers dkms broadcom-wl-dkms iw wpa_supplicant
sudo reboot

cp ~/dotfiles/DigiCert_Global_Root_CA.der ~/
sudo nmcli connection add type wifi con-name "psu" ifname wlan0 ssid "psu" -- wifi-sec.key-mgmt wpa-eap 802-1x.eap ttls 802-1x.phase2-auth pap 802-1x.identity "uut47" 802-1x.ca-cert "~/DigiCert_Global_Root_CA.der" 802-1x.password aaaaaaaa
