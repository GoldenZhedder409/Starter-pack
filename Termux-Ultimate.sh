#!/bin/bash

#=========================================================#
#    ULTIMATE TERMUX PRO - ALL IN ONE INSTALLER v3.0     #
#    "Install Everything, Code Anything, Run Anywhere"   #
#=========================================================#

# Warna buat tampilan kece
R='\033[1;31m'
G='\033[1;32m'
Y='\033[1;33m'
B='\033[1;34m'
P='\033[1;35m'
C='\033[1;36m'
W='\033[1;37m'
N='\033[0m'

# Banner keren
clear
echo -e "${C}"
figlet -f big "TERMUX" | lolcat
figlet -f slant "ULTIMATE PRO" | lolcat
echo -e "${W}╔══════════════════════════════════════════════════════════╗${N}"
echo -e "${W}║${G}          ALL IN ONE DEVELOPMENT ENVIRONMENT             ${W}║${N}"
echo -e "${W}║${Y}     Python | Go | Ruby | NodeJS | C/C++ | Java         ${W}║${N}"
echo -e "${W}║${C}           PHP | Perl | Rust | Proot Ubuntu             ${W}║${N}"
echo -e "${W}╚══════════════════════════════════════════════════════════╝${N}"
echo -e "${P}            [*] Initializing Ultimate Setup... [*]${N}"
sleep 3

# Update & upgrade
echo -e "${G}[+] Updating Termux packages...${N}"
pkg update -y && pkg upgrade -y

# Install essential tools
echo -e "${G}[+] Installing essential tools...${N}"
pkg install -y \
    git \
    wget \
    curl \
    nano \
    vim \
    htop \
    neofetch \
    tree \
    zip \
    unzip \
    tar \
    openssh \
    termux-api \
    termux-tools \
    lolcat \
    figlet \
    cowsay \
    cmatrix \
    sl \
    fish \
    zsh \
    tmux

# Programming Languages - ALL OF THEM!
echo -e "${G}[+] Installing ALL Programming Languages...${N}"

# Python & pip (plus packages)
echo -e "${Y}  └─ Installing Python & Packages...${N}"
pkg install -y python python2 python3 python-dev
pkg install -y pip pip2 pip3
pip install --upgrade pip
pip install \
    numpy \
    pandas \
    matplotlib \
    scikit-learn \
    tensorflow \
    torch \
    django \
    flask \
    fastapi \
    requests \
    beautifulsoup4 \
    selenium \
    jupyter \
    notebook \
    ipython \
    virtualenv

# Go Language
echo -e "${Y}  └─ Installing Go Language...${N}"
pkg install -y golang
mkdir -p $HOME/go/{bin,src,pkg}
echo 'export GOPATH=$HOME/go' >> ~/.bashrc
echo 'export PATH=$PATH:$GOPATH/bin' >> ~/.bashrc

# Ruby
echo -e "${Y}  └─ Installing Ruby...${N}"
pkg install -y ruby ruby-dev
gem install \
    rails \
    sinatra \
    rspec \
    pry \
    bundler \
    jekyll

# NodeJS & npm
echo -e "${Y}  └─ Installing NodeJS & npm...${N}"
pkg install -y nodejs nodejs-lts
npm install -g \
    yarn \
    typescript \
    express \
    react \
    vue-cli \
    angular-cli \
    next \
    nestjs \
    pm2 \
    nodemon \
    webpack \
    eslint \
    prettier

# C/C++ Development
echo -e "${Y}  └─ Installing C/C++ Tools...${N}"
pkg install -y \
    gcc \
    g++ \
    clang \
    make \
    cmake \
    gdb \
    valgrind \
    ninja \
    autoconf \
    automake \
    libtool

# Java & Kotlin
echo -e "${Y}  └─ Installing Java & Kotlin...${N}"
pkg install -y openjdk-17 openjdk-8
pkg install -y kotlin
pkg install -y gradle maven

# PHP & Composer
echo -e "${Y}  └─ Installing PHP...${N}"
pkg install -y php php-apache php-fpm php-mysql php-curl php-xml php-mbstring
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php
php -r "unlink('composer-setup.php');"
mv composer.phar $PREFIX/bin/composer

# Rust
echo -e "${Y}  └─ Installing Rust...${N}"
pkg install -y rust rustc cargo
cargo install \
    ripgrep \
    fd-find \
    bat \
    exa \
    tokei

# Perl
echo -e "${Y}  └─ Installing Perl...${N}"
pkg install -y perl

# R Language
echo -e "${Y}  └─ Installing R Language...${N}"
pkg install -y R

# Lua
echo -e "${Y}  └─ Installing Lua...${N}"
pkg install -y lua luajit luarocks

# Dart & Flutter (if possible)
echo -e "${Y}  └─ Installing Dart...${N}"
pkg install -y dart

# Proot Ubuntu (Full Linux Environment)
echo -e "${G}[+] Setting up Proot Ubuntu...${N}"
pkg install -y proot proot-distro
proot-distro install ubuntu
proot-distro login ubuntu -- apt update && apt upgrade -y
proot-distro login ubuntu -- apt install -y \
    build-essential \
    git \
    curl \
    wget \
    vim \
    nano \
    python3 \
    python3-pip \
    nodejs \
    npm \
    ruby \
    golang \
    openjdk-17-jdk \
    php \
    perl \
    rustc \
    cargo

# Database Systems
echo -e "${G}[+] Installing Databases...${N}"
pkg install -y mariadb postgresql mongodb redis sqlite

# Development Tools & Extras
echo -e "${G}[+] Installing Extra Dev Tools...${N}"
pkg install -y \
    tmux \
    screen \
    byobu \
    man \
    manpages \
    strace \
    ltrace \
    tcpdump \
    netcat-openbsd \
    nmap \
    sqlmap \
    hydra \
    metasploit \
    aircrack-ng \
    wireshark \
    nikto \
    exploitdb

# Terminal Customization
echo -e "${G}[+] Setting up terminal customization...${N}"
# Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
# Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
sed -i 's/ZSH_THEME=".*"/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc

# Setup Bash config
cat >> ~/.bashrc << 'EOF'

# TERMUX ULTIMATE CONFIG
alias ll='ls -la'
alias la='ls -a'
alias update='pkg update && pkg upgrade'
alias install-all='pkg install -y python golang ruby nodejs php rust perl R lua'
alias ubuntu='proot-distro login ubuntu'
alias neofetch='neofetch --ascii_distro Termux'

# PATH additions
export PATH=$PATH:$HOME/go/bin:$HOME/.cargo/bin:$HOME/.local/bin

# Welcome message
echo -e "\033[1;32m"
figlet -f small "Welcome Back!"
echo -e "\033[1;36m"
echo "⚡ Ultimate Termux Environment Loaded"
echo "📦 All Languages: Python, Go, Ruby, NodeJS, Java, C/C++, PHP, Rust, Perl, R"
echo "🐧 Ubuntu: Type 'ubuntu' to enter"
echo -e "\033[0m"
EOF

# Create startup script
cat > ~/termux-ultimate.sh << 'EOF'
#!/bin/bash
echo -e "\033[1;35m"
figlet -f standard "TERMUX PRO"
echo -e "\033[1;36m"
echo "========================================="
echo "Languages Installed:"
echo "✅ Python 2/3 | Go | Ruby | NodeJS"
echo "✅ Java | Kotlin | C/C++ | PHP | Rust"
echo "✅ Perl | R | Lua | Dart"
echo "========================================="
echo "Databases: MariaDB | PostgreSQL | MongoDB"
echo "Tools: Git | Curl | Wget | Nano | Vim"
echo "Ubuntu: proot-distro login ubuntu"
echo "========================================="
neofetch
EOF

chmod +x ~/termux-ultimate.sh

# Final setup
echo -e "${G}[+] Cleaning up...${N}"
pkg clean

# Success message with cool banner
clear
echo -e "${P}"
figlet -f slant "INSTALLATION" | lolcat
figlet -f big "COMPLETE!" | lolcat
echo -e "${G}╔══════════════════════════════════════════════════════════╗${N}"
echo -e "${G}║                                                          ║${N}"
echo -e "${G}║${Y}     🎉 ALL PACKAGES INSTALLED SUCCESSFULLY! 🎉         ${G}║${N}"
echo -e "${G}║                                                          ║${N}"
echo -e "${G}║${C}     Languages: Python, Go, Ruby, NodeJS, Java         ${G}║${N}"
echo -e "${G}║${C}                C/C++, PHP, Rust, Perl, R, Lua        ${G}║${N}"
echo -e "${G}║${C}                Dart, Kotlin                          ${G}║${N}"
echo -e "${G}║                                                          ║${N}"
echo -e "${G}║${W}     🐧 Ubuntu Proot: 'proot-distro login ubuntu'       ${G}║${N}"
echo -e "${G}║                                                          ║${N}"
echo -e "${G}║${P}     Run './termux-ultimate.sh' for system info         ${G}║${N}"
echo -e "${G}║                                                          ║${N}"
echo -e "${G}╚══════════════════════════════════════════════════════════╝${N}"
echo -e "${Y}"
echo "       ╱╲      ╱╲"
echo "      ╱  ╲    ╱  ╲"
echo "     ╱    ╲  ╱    ╲"
echo "    ╱      ╲╱      ╲"
echo "   ╱  🚀   ENJOY!   ╲"
echo "  ╱__________________╲"
echo -e "${N}"

# Run neofetch
neofetch
