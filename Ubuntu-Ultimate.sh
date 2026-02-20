#!/bin/bash

#=========================================================#
#    ULTIMATE DEV ENVIRONMENT - DEBIAN/UBUNTU EDITION     #
#       "One Script to Rule All Development Tools"        #
#=========================================================#

# Warna kece
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m'

# Banner khas Debian
clear
echo -e "${BLUE}"
cat << "EOF"
    ____       _     _               _   _               
   |  _ \  ___| |__ (_)_ __   __ _  | | | |_   _ _ __    
   | | | |/ _ \ '_ \| | '_ \ / _` | | |_| | | | | '_ \   
   | |_| |  __/ |_) | | | | | (_| | |  _  | |_| | | | |  
   |____/ \___|_.__/|_|_| |_|\__, | |_| |_|\__,_|_| |_|  
                             |___/                        
EOF
echo -e "${WHITE}╔══════════════════════════════════════════════════════════╗${NC}"
echo -e "${WHITE}║${GREEN}            ULTIMATE DEVELOPMENT ENVIRONMENT            ${WHITE}║${NC}"
echo -e "${WHITE}║${YELLOW}     Python | Go | Ruby | NodeJS | Java | C/C++         ${WHITE}║${NC}"
echo -e "${WHITE}║${CYAN}        Rust | PHP | Perl | R | Lua | Dart | Kotlin       ${WHITE}║${NC}"
echo -e "${WHITE}╚══════════════════════════════════════════════════════════╝${NC}"
echo -e "${PURPLE}            [*] Initializing Debian/Ubuntu Setup... [*]${NC}"
sleep 3

# Check root
if [[ $EUID -eq 0 ]]; then
   echo -e "${GREEN}✓ Running as root${NC}"
else
   echo -e "${YELLOW}⚠ Running as normal user (sudo will be used when needed)${NC}"
fi

# Update system
echo -e "${CYAN}[+] Updating system packages...${NC}"
sudo apt update -y && sudo apt upgrade -y

# Install essential tools
echo -e "${CYAN}[+] Installing essential tools...${NC}"
sudo apt install -y \
    wget \
    curl \
    git \
    vim \
    nano \
    htop \
    neofetch \
    tree \
    unzip \
    zip \
    gzip \
    tar \
    openssh-server \
    net-tools \
    software-properties-common \
    apt-transport-https \
    ca-certificates \
    gnupg \
    lsb-release \
    build-essential \
    cmake \
    make \
    gcc \
    g++ \
    gdb \
    tmux \
    screen \
    fish \
    zsh \
    bash-completion \
    terminator

# ============ PROGRAMMING LANGUAGES ============

# Python (ALL versions)
echo -e "${YELLOW}  └─ Installing Python & packages...${NC}"
sudo apt install -y python2 python3 python3-pip python3-dev python3-venv
sudo apt install -y python3-pip python3-setuptools python3-wheel
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
sudo python2 get-pip.py 2>/dev/null || true
rm get-pip.py

# Python global packages
pip3 install --upgrade pip
pip3 install \
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

# Go Language
echo -e "${YELLOW}  └─ Installing Go...${NC}"
wget https://golang.org/dl/go1.21.0.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.21.0.linux-amd64.tar.gz
rm go1.21.0.linux-amd64.tar.gz
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
echo 'export GOPATH=$HOME/go' >> ~/.bashrc
echo 'export PATH=$PATH:$GOPATH/bin' >> ~/.bashrc
export PATH=$PATH:/usr/local/go/bin
mkdir -p ~/go/{bin,src,pkg}

# Ruby
echo -e "${YELLOW}  └─ Installing Ruby...${NC}"
sudo apt install -y ruby-full ruby-dev
sudo gem install \
    rails \
    sinatra \
    rspec \
    pry \
    bundler \
    jekyll \
    rubocop \
    rails-api

# NodeJS & npm (via nvm for latest)
echo -e "${YELLOW}  └─ Installing NodeJS...${NC}"
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt install -y nodejs
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
    @vue/cli \
    pm2 \
    nodemon \
    webpack \
    webpack-cli \
    eslint \
    prettier \
    gulp \
    grunt-cli \
    babel-cli \
    http-server \
    live-server

# Java (Multiple versions)
echo -e "${YELLOW}  └─ Installing Java...${NC}"
sudo apt install -y openjdk-11-jdk openjdk-17-jdk openjdk-8-jdk
sudo apt install -y maven gradle ant

# Kotlin
echo -e "${YELLOW}  └─ Installing Kotlin...${NC}"
sudo snap install kotlin --classic 2>/dev/null || {
    curl -s https://get.sdkman.io | bash
    source "$HOME/.sdkman/bin/sdkman-init.sh"
    sdk install kotlin
}

# C/C++ Extras
echo -e "${YELLOW}  └─ Installing C/C++ extras...${NC}"
sudo apt install -y \
    clang \
    clangd \
    lldb \
    llvm \
    valgrind \
    autoconf \
    automake \
    libtool \
    meson \
    ninja-build \
    doxygen \
    graphviz

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
sudo apt install -y php php-cli php-fpm php-mysql php-pgsql \
    php-mongodb php-redis php-memcached php-xml php-mbstring \
    php-curl php-zip php-gd php-bcmath php-intl php-soap

# Composer
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php
php -r "unlink('composer-setup.php');"
sudo mv composer.phar /usr/local/bin/composer

# Perl
echo -e "${YELLOW}  └─ Installing Perl...${NC}"
sudo apt install -y perl perl-doc cpanminus
sudo cpanm Modern::Perl Moose DBI DBD::mysql LWP::Simple

# R Language
echo -e "${YELLOW}  └─ Installing R...${NC}"
sudo apt install -y r-base r-base-dev
sudo apt install -y libssl-dev libxml2-dev libcurl4-openssl-dev

# Lua
echo -e "${YELLOW}  └─ Installing Lua...${NC}"
sudo apt install -y lua5.3 lua5.3-dev luarocks
sudo luarocks install luasocket
sudo luarocks install luasec

# Dart
echo -e "${YELLOW}  └─ Installing Dart...${NC}"
sudo sh -c 'wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -'
sudo sh -c 'wget -qO- https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_stable.list > /etc/apt/sources.list.d/dart_stable.list'
sudo apt update
sudo apt install -y dart

# ============ DATABASES ============

echo -e "${CYAN}[+] Installing Databases...${NC}"

# MySQL/MariaDB
sudo apt install -y mariadb-server mariadb-client
sudo systemctl enable mariadb 2>/dev/null || sudo service mariadb start

# PostgreSQL
sudo apt install -y postgresql postgresql-contrib
sudo systemctl enable postgresql 2>/dev/null || sudo service postgresql start

# MongoDB
wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list
sudo apt update
sudo apt install -y mongodb-org

# Redis
sudo apt install -y redis-server
sudo systemctl enable redis-server 2>/dev/null || sudo service redis-server start

# SQLite
sudo apt install -y sqlite3 sqlitebrowser

# ============ CONTAINERS & VIRTUALIZATION ============

echo -e "${CYAN}[+] Installing Docker & Containers...${NC}"
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker $USER
sudo apt install -y docker-compose

# ============ DEVELOPMENT TOOLS ============

echo -e "${CYAN}[+] Installing Development Tools...${NC}"
sudo apt install -y \
    git-flow \
    subversion \
    mercurial \
    jq \
    yq \
    httpie \
    postman \
    insomnia \
    wireshark \
    nmap \
    netcat \
    tcpdump \
    ffmpeg \
    imagemagick \
    graphviz

# VS Code
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt update
sudo apt install -y code

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
sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting docker docker-compose node npm python pip)/' ~/.zshrc

# ============ CREATE WELCOME SCRIPT ============

cat > ~/dev-info.sh << 'EOF'
#!/bin/bash
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m'

clear
echo -e "${BLUE}"
cat << "EOF"
    ╔════════════════════════════════════════════════╗
    ║     DEVELOPMENT ENVIRONMENT LOADED! 🚀        ║
    ╚════════════════════════════════════════════════╝
EOF
echo -e "${NC}"

echo -e "${GREEN}📦 LANGUAGES INSTALLED:${NC}"
echo -e "${WHITE}  Python 2/3 | Go | Ruby | NodeJS | Java 8/11/17${NC}"
echo -e "${WHITE}  Kotlin | C/C++ | Rust | PHP | Perl | R${NC}"
echo -e "${WHITE}  Lua | Dart${NC}"
echo

echo -e "${YELLOW}🗄️  DATABASES:${NC}"
echo -e "${WHITE}  MySQL/MariaDB | PostgreSQL | MongoDB | Redis | SQLite${NC}"
echo

echo -e "${CYAN}🐳 CONTAINERS:${NC}"
echo -e "${WHITE}  Docker | Docker Compose${NC}"
echo

echo -e "${PURPLE}💻 VS Code: 'code' to launch${NC}"
echo -e "${PURPLE}📝 ZSH with Powerlevel10k ready!${NC}"
echo

neofetch
EOF

chmod +x ~/dev-info.sh

# Add to bashrc
cat >> ~/.bashrc << 'EOF'

# Ultimate Dev Environment
alias ll='ls -la'
alias la='ls -A'
alias update='sudo apt update && sudo apt upgrade'
alias install-pkg='sudo apt install'
alias docker-clean='docker system prune -af'
alias dev-info='~/dev-info.sh'

# PATH additions
export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin:$HOME/.cargo/bin:$HOME/.local/bin

# Welcome message
if [ -f ~/dev-info.sh ]; then
    ~/dev-info.sh
fi
EOF

# ============ FINISH ============

clear
echo -e "${GREEN}"
cat << "EOF"
    ╔═══════════════════════════════════════════════════════════╗
    ║                                                           ║
    ║   🎉 INSTALLATION COMPLETE! EVERYTHING IS READY! 🎉      ║
    ║                                                           ║
    ╚═══════════════════════════════════════════════════════════╝
EOF
echo -e "${NC}"

echo -e "${YELLOW}Languages installed:${NC}"
echo -e "  ✓ Python 2/3"
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
echo -e "${WHITE}Run 'dev-info' to see system info${NC}"
echo -e "${WHITE}Or simply restart your terminal!${NC}"
echo
echo -e "${BLUE}Enjoy your Ultimate Dev Environment! 🚀${NC}"
