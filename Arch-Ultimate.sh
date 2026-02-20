#!/bin/bash

#=========================================================#
#    ULTIMATE DEV ENVIRONMENT - ARCH/MANJARO EDITION      #
#       "One Script to Rule All Development Tools"        #
#=========================================================#

# Warna kece (Arch style - blue theme)
BLUE='\033[0;34m'
LBLUE='\033[1;34m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m'

# Banner Arch Linux
clear
echo -e "${BLUE}"
cat << "EOF"
    _    ____ _   _ _   _ ____  
   / \  / ___| | | | | | |  _ \ 
  / _ \| |   | |_| | |_| | |_) |
 / ___ \ |___|  _  |  _  |  __/ 
/_/   \_\____|_| |_|_| |_|_|    
EOF
echo -e "${WHITE}╔══════════════════════════════════════════════════════════╗${NC}"
echo -e "${WHITE}║${GREEN}            ARCH LINUX - ULTIMATE DEV ENV             ${WHITE}║${NC}"
echo -e "${WHITE}║${YELLOW}     Python | Go | Ruby | NodeJS | Java | C/C++       ${WHITE}║${NC}"
echo -e "${WHITE}║${CYAN}        Rust | PHP | Perl | R | Lua | Dart              ${WHITE}║${NC}"
echo -e "${WHITE}╚══════════════════════════════════════════════════════════╝${NC}"
echo -e "${PURPLE}            [*] Initializing Arch/Manjaro Setup... [*]${NC}"
sleep 3

# Check if running as root
if [[ $EUID -eq 0 ]]; then
   echo -e "${GREEN}✓ Running as root${NC}"
else
   echo -e "${YELLOW}⚠ Running as normal user (sudo will be used)${NC}"
fi

# Detect package manager
if command -v pacman &> /dev/null; then
    PKG_MANAGER="pacman"
    echo -e "${GREEN}✓ Detected Arch-based system${NC}"
elif command -v yay &> /dev/null; then
    PKG_MANAGER="yay"
    echo -e "${GREEN}✓ Detected yay AUR helper${NC}"
else
    echo -e "${YELLOW}⚠ Installing yay AUR helper...${NC}"
    sudo pacman -S --needed git base-devel
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    cd ..
    rm -rf yay
    PKG_MANAGER="yay"
fi

# Update system
echo -e "${CYAN}[+] Updating system...${NC}"
sudo pacman -Syu --noconfirm

# Install essential tools
echo -e "${CYAN}[+] Installing essential tools...${NC}"
sudo pacman -S --noconfirm \
    base-devel \
    git \
    wget \
    curl \
    vim \
    nano \
    htop \
    neofetch \
    tree \
    unzip \
    zip \
    tar \
    openssh \
    net-tools \
    cmake \
    make \
    gcc \
    gdb \
    tmux \
    screen \
    fish \
    zsh \
    terminator \
    which

# ============ PROGRAMMING LANGUAGES ============

# Python
echo -e "${YELLOW}  └─ Installing Python & packages...${NC}"
sudo pacman -S --noconfirm \
    python \
    python-pip \
    python-virtualenv \
    python-setuptools \
    python-wheel

# Python global packages
pip install --upgrade pip
pip install \
    numpy \
    pandas \
    matplotlib \
    seaborn \
    scikit-learn \
    tensorflow \
    torch \
    torchvision \
    keras \
    jupyter \
    notebook \
    ipython \
    django \
    flask \
    fastapi \
    requests \
    beautifulsoup4 \
    selenium \
    scrapy \
    pytest \
    pylint \
    black \
    mypy \
    virtualenv \
    pipenv \
    poetry

# Go
echo -e "${YELLOW}  └─ Installing Go...${NC}"
sudo pacman -S --noconfirm go
mkdir -p ~/go/{bin,src,pkg}
echo 'export GOPATH=$HOME/go' >> ~/.bashrc
echo 'export PATH=$PATH:$GOPATH/bin' >> ~/.bashrc

# Ruby
echo -e "${YELLOW}  └─ Installing Ruby...${NC}"
sudo pacman -S --noconfirm ruby ruby-rdoc ruby-irb
gem install \
    rails \
    sinatra \
    rspec \
    pry \
    bundler \
    jekyll \
    rubocop

# NodeJS
echo -e "${YELLOW}  └─ Installing NodeJS...${NC}"
sudo pacman -S --noconfirm nodejs npm
sudo npm install -g n
sudo n stable

# Global npm packages
sudo npm install -g \
    yarn \
    pnpm \
    typescript \
    ts-node \
    express \
    nestjs \
    @angular/cli \
    create-react-app \
    next \
    nuxt \
    vue-cli \
    pm2 \
    nodemon \
    webpack \
    webpack-cli \
    eslint \
    prettier

# Java
echo -e "${YELLOW}  └─ Installing Java...${NC}"
sudo pacman -S --noconfirm jdk11-openjdk jdk17-openjdk jdk8-openjdk
sudo pacman -S --noconfirm maven gradle

# Kotlin
echo -e "${YELLOW}  └─ Installing Kotlin...${NC}"
$PKG_MANAGER -S --noconfirm kotlin 2>/dev/null || {
    curl -s https://get.sdkman.io | bash
    source "$HOME/.sdkman/bin/sdkman-init.sh"
    sdk install kotlin
}

# C/C++ Extras
echo -e "${YELLOW}  └─ Installing C/C++ extras...${NC}"
sudo pacman -S --noconfirm \
    clang \
    lldb \
    llvm \
    valgrind \
    autoconf \
    automake \
    libtool \
    meson \
    ninja \
    doxygen

# Rust
echo -e "${YELLOW}  └─ Installing Rust...${NC}"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source $HOME/.cargo/env
rustup component add rustfmt clippy
rustup target add wasm32-unknown-unknown
cargo install \
    ripgrep \
    fd-find \
    bat \
    exa \
    tokei \
    du-dust \
    procs \
    hyperfine

# PHP
echo -e "${YELLOW}  └─ Installing PHP...${NC}"
sudo pacman -S --noconfirm \
    php \
    php-fpm \
    php-mysql \
    php-pgsql \
    php-mongodb \
    php-redis \
    php-memcached \
    php-xml \
    php-mbstring \
    php-curl \
    php-zip \
    php-gd \
    php-intl

# Composer
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php
php -r "unlink('composer-setup.php');"
sudo mv composer.phar /usr/local/bin/composer

# Perl
echo -e "${YELLOW}  └─ Installing Perl...${NC}"
sudo pacman -S --noconfirm perl perl-cpanminus
sudo cpanm Modern::Perl Moose DBI

# R Language
echo -e "${YELLOW}  └─ Installing R...${NC}"
sudo pacman -S --noconfirm r

# Lua
echo -e "${YELLOW}  └─ Installing Lua...${NC}"
sudo pacman -S --noconfirm lua luarocks
sudo luarocks install luasocket

# Dart
echo -e "${YELLOW}  └─ Installing Dart...${NC}"
$PKG_MANAGER -S --noconfirm dart 2>/dev/null || {
    git clone https://aur.archlinux.org/dart.git
    cd dart
    makepkg -si
    cd ..
    rm -rf dart
}

# ============ DATABASES ============

echo -e "${CYAN}[+] Installing Databases...${NC}"

# MariaDB/MySQL
sudo pacman -S --noconfirm mariadb
sudo mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
sudo systemctl enable mariadb 2>/dev/null || sudo systemctl start mariadb

# PostgreSQL
sudo pacman -S --noconfirm postgresql
sudo -u postgres initdb -D /var/lib/postgres/data
sudo systemctl enable postgresql 2>/dev/null || sudo systemctl start postgresql

# MongoDB
$PKG_MANAGER -S --noconfirm mongodb mongodb-tools 2>/dev/null
sudo systemctl enable mongodb 2>/dev/null || sudo systemctl start mongodb

# Redis
sudo pacman -S --noconfirm redis
sudo systemctl enable redis 2>/dev/null || sudo systemctl start redis

# SQLite
sudo pacman -S --noconfirm sqlite sqlitebrowser

# ============ CONTAINERS ============

echo -e "${CYAN}[+] Installing Docker...${NC}"
sudo pacman -S --noconfirm docker docker-compose
sudo systemctl enable docker 2>/dev/null || sudo systemctl start docker
sudo usermod -aG docker $USER

# ============ DEVELOPMENT TOOLS ============

echo -e "${CYAN}[+] Installing Development Tools...${NC}"
sudo pacman -S --noconfirm \
    git-flow \
    subversion \
    jq \
    httpie \
    wireshark-qt \
    nmap \
    netcat \
    tcpdump \
    ffmpeg \
    imagemagick

# VS Code (via AUR)
$PKG_MANAGER -S --noconfirm visual-studio-code-bin

# ============ AUR PACKAGES ============

echo -e "${CYAN}[+] Installing AUR packages...${NC}"
if command -v yay &> /dev/null; then
    yay -S --noconfirm \
        google-chrome \
        postman-bin \
        insomnia-bin \
        slack-desktop \
        discord \
        spotify
fi

# ============ SHELL CUSTOMIZATION ============

echo -e "${CYAN}[+] Setting up Shell Customization...${NC}"

# Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
sed -i 's/ZSH_THEME=".*"/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc

# Zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting docker docker-compose node npm python pip archlinux)/' ~/.zshrc

# ============ CREATE WELCOME SCRIPT ============

cat > ~/arch-dev.sh << 'EOF'
#!/bin/bash
BLUE='\033[0;34m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m'

clear
echo -e "${BLUE}"
cat << "EOF"
    ╔════════════════════════════════════════════════╗
    ║     ARCH DEVELOPMENT ENVIRONMENT LOADED!      ║
    ║              BTW I USE ARCH 🔵                ║
    ╚════════════════════════════════════════════════╝
EOF
echo -e "${NC}"

echo -e "${GREEN}📦 LANGUAGES INSTALLED:${NC}"
echo -e "${WHITE}  Python | Go | Ruby | NodeJS | Java 8/11/17${NC}"
echo -e "${WHITE}  Kotlin | C/C++ | Rust | PHP | Perl | R${NC}"
echo -e "${WHITE}  Lua | Dart${NC}"
echo

echo -e "${YELLOW}🗄️  DATABASES:${NC}"
echo -e "${WHITE}  MariaDB | PostgreSQL | MongoDB | Redis | SQLite${NC}"
echo

echo -e "${CYAN}🐳 Docker & Docker Compose installed${NC}"
echo -e "${PURPLE}💻 VS Code: 'code' to launch${NC}"
echo

neofetch
EOF

chmod +x ~/arch-dev.sh

# Add to bashrc
cat >> ~/.bashrc << 'EOF'

# Ultimate Arch Dev Environment
alias ll='ls -la'
alias la='ls -A'
alias update='sudo pacman -Syu'
alias install='sudo pacman -S'
alias aur='yay -S'
alias docker-clean='docker system prune -af'
alias dev-info='~/arch-dev.sh'

# PATH additions
export PATH=$PATH:$HOME/go/bin:$HOME/.cargo/bin:$HOME/.local/bin

# Welcome message
if [ -f ~/arch-dev.sh ]; then
    ~/arch-dev.sh
fi
EOF

# ============ FINISH ============

clear
echo -e "${BLUE}"
cat << "EOF"
    ╔═══════════════════════════════════════════════════════════╗
    ║                                                           ║
    ║   🎉 ARCH INSTALLATION COMPLETE! EVERYTHING IS READY! 🎉 ║
    ║                                                           ║
    ╚═══════════════════════════════════════════════════════════╝
EOF
echo -e "${NC}"

echo -e "${GREEN}Languages installed:${NC}"
echo -e "  ✓ Python"
echo -e "  ✓ Go"
echo -e "  ✓ Ruby"
echo -e "  ✓ NodeJS"
echo -e "  ✓ Java (8,11,17)"
echo -e "  ✓ Kotlin"
echo -e "  ✓ C/C++ (gcc, clang)"
echo -e "  ✓ Rust"
echo -e "  ✓ PHP"
echo -e "  ✓ Perl"
echo -e "  ✓ R"
echo -e "  ✓ Lua"
echo -e "  ✓ Dart"
echo
echo -e "${CYAN}Databases: MariaDB, PostgreSQL, MongoDB, Redis, SQLite${NC}"
echo -e "${PURPLE}Docker & Docker Compose installed${NC}"
echo -e "${GREEN}VS Code installed${NC}"
echo
echo -e "${YELLOW}AUR packages: Chrome, Postman, Insomnia, Slack${NC}"
echo
echo -e "${WHITE}Run 'arch-dev' to see system info${NC}"
echo -e "${WHITE}Restart your terminal or run 'source ~/.bashrc'${NC}"
echo
echo -e "${BLUE}BTW, you now have the ULTIMATE Arch Dev Environment! 🚀${NC}"
