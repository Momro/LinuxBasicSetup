# Raspberry Pi Basic Setup

```
sudo apt update && sudo apt upgrade -y && sudo apt install -y make curl git neovim && sudo apt autoremove -y && sudo apt dist-upgrade -y && curl -s https://raw.githubusercontent.com/Momro/zshconfig/refs/heads/main/install.sh | bash
```

# UbuntuSetup

## Minimale Installation mit Zusatzpaketen
```
sudo apt install konsole gcc make curl git neovim
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

# SSH

https://github.com/Momro/ssh-config/tree/main

## private key generieren

In Windows:
```
$ ssh-keygen
$ cat <file>
ssh-ed25519 ...... user@host
```

In Linux:
```
key="ssh-ed25519 ...... user@host"
mkdir ~/.ssh
echo $key >> ~/.ssh/authorized_keys
```

# ZSH

https://github.com/Momro/zshconfig
```
curl -s https://raw.githubusercontent.com/Momro/zshconfig/refs/heads/main/install.sh | bash
```

# visudo auf vi
sudo update-alternatives --config editor
