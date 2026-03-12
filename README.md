# Starter-pack (What is this)
It's just a tool that makes it easier for you to play with the terminal, download several programming languages, and the needs for your terminal

# How to use? 🚀
### Termux (Mobile/Android)📱
Run this on you termux (frist time)
```bash
pkg update && pkg upgrade -y
pkg install git python python3 nano vim curl wget -y
termux-setup-storage
git clone https://github.com/GoldenZhedder409/Starter-pack.git
cd Starter-pack
chmod +x Termux-Ultimate.sh
./Termux-Ultimate.sh
```

### Ubuntu (Laptop/PC)🖥️
Run this on you Ubuntu/debian family (frist time)
```bash
sudo apt update && sudo apt upgrade -y
sudo apt install git curl wget build-essential -y
sudo apt install python3 python3-pip python3-venv -y
sudo apt install vim nano neovim -y
sudo apt install net-tools nmap -y
sudo apt install unzip zip -y
sudo git clone https://github.com/GoldenZhedder409/Starter-pack.git
cd Starter-pack
chmod +x Ubuntu-Ultimate.sh
./Ubuntu-Ultimate.sh
```

### Arch Linux (Laptop/PC)🖥️
Run this on you Arch family (frist time)
```bash
sudo pacman -Syu
sudo pacman -Sc
sudo pacman -S git curl wget base-devel --noconfirm
sudo pacman -S python python-pip python-virtualenv
sudo pacman -S vim nano neovim
sudo pacman -S net-tools nmap wireshark-qt
sudo pacman -S unzip zip p7zip
sudo git clone https://github.com/GoldenZhedder409/Starter-pack.git
cd Starter-pack
chmod +x Arch-Ultimate.sh
./Arch-Ultimate.sh
cd ~
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```
