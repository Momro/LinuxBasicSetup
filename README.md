# UbuntuSetup

## Minimale Installation mit Zusatzpaketen
```
sudo apt install konsole
sudo apt install gcc
sudo apt install make
sudo apt install curl
```

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

* Gemeinsame Zwischenablage anschalten
* 
