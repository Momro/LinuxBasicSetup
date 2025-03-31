sudo apt update
sudo apt upgrade -y
sudo apt install -y make curl git neovim
sudo apt autoremove -y
sudo apt dist-upgrade -y
echo "[+] Install ZSH"
curl -s https://raw.githubusercontent.com/Momro/zshconfig/refs/heads/main/install.sh | bash
