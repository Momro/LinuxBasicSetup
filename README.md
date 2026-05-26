# Raspberry Pi Basic Setup

```
sudo apt install screen -y
screen -S install
```
Dann:
```
sudo apt install -y make curl git neovim net-tools jq iputils-ping dnsutils cron cifs-utils nfs-common smbclient && curl -s https://raw.githubusercontent.com/Momro/zshconfig/refs/heads/main/install.sh | bash && sudo apt update && sudo apt upgrade -y &&  sudo apt autoremove -y && sudo apt dist-upgrade -y
```

# UbuntuSetup

## MotD

```
# remove executable bit, so the original files cannot be executed anymore -> so we don't have to delete them
for f in /etc/update-motd.d/* ; do
  sudo chmod -x $f
done

# create new file, and make it executable
sudo touch /etc/update-motd.d/00-custom-header
sudo chmod +x /etc/update-motd.d/00-custom-header
```

Insert this content into the `00-custom-header`:

```
#!/bin/sh
echo ""
echo "### === SSH CONNECTION === ###"
echo ""

# Hostname
echo "Host:        $(hostname)"

# read OS version
if [ -f /etc/os-release ]; then
    . /etc/os-release
    echo "OS version:  $PRETTY_NAME"
fi

# get primary IPv4
IP_ADDR=$(ip -4 addr show $(ip route | awk '/default/ {print $5}' | head -n1) | awk '/inet / {print $2}' | cut -d/ -f1)
if [ -n "$IP_ADDR" ]; then
    echo "IP Address:  $IP_ADDR"
fi

echo "" # empty line at the end for optics
```

## time zone
```
sudo timedatectl set-timezone Europe/Berlin
```

## Minimale Installation mit Zusatzpaketen

```
sudo apt install konsole gcc make curl git neovim screen net-tools flameshot vivaldi-stable
```

## Signal

```
wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg
cat signal-desktop-keyring.gpg | sudo tee /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null
wget -O signal-desktop.sources https://updates.signal.org/static/desktop/apt/signal-desktop.sources
cat signal-desktop.sources | sudo tee /etc/apt/sources.list.d/signal-desktop.sources > /dev/null
sudo apt update && sudo apt install signal-desktop
```

## Guest Additions
```
sudo apt install perl gcc make
sudo /media/.../VBoxLinuxAdditions.run
```

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

# Alpine

apk add openssh
rc-update add sshd default
sed -i '/^#*PermitRootLogin/c\PermitRootLogin yes' /etc/ssh/sshd_config
rc-service sshd start

login via SSH

apk update && apk upgrade

Alpine LXC with Browser [https://www.filipnet.de/proxmox-lxc-alpine-browser/]

Also install xorgxrdp. It won't work otherwise:
```
apk add xorgxrdp
```


Signal:

Signal:~# cat /etc/apk/repositories 
https://dl-cdn.alpinelinux.org/alpine/v3.22/main
https://dl-cdn.alpinelinux.org/alpine/v3.22/community
http://dl-cdn.alpinelinux.org/alpine/edge/main
http://dl-cdn.alpinelinux.org/alpine/edge/community
http://dl-cdn.alpinelinux.org/alpine/edge/testingz


Signal:~# cat /home/<user>/.xsession
#!/bin/sh

#
# ~/.xsession
#
# Executed by xdm/gdm/kdm at login
#

/bin/sh -l ~/.xinitrc

xrdp-chansrv &
signal-desktop --start-maximized --disable-gpu &
autocutsel -fork &
exec openbox-session
