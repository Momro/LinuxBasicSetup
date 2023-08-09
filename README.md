# UbuntuSetup

## Guest Additions
sudo apt install perl gcc make
sudo /media/.../VBoxLinuxAdditions.run

## Shared Folder stuff
```
sudo usermod -aG vboxsf $USER

sudo apt update
sudo apt install build-essential dkms linux-headers-$(uname -r);
sudo apt install virtualbox-guest-x11
sudo apt install virtualbox-guest-dkms
```
