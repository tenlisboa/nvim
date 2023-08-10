#!/bin/zsh

USED_SHELL_FILEPATH=~/.zshrc
NODE_VERSION=18
GOVERSION=1.20.7

get_os_packager() {
  if [ $(command -v dnf | wc -l) = 1 ]; then
    return dnf
  fi

  if [ $(command -v apt | wc -l) = 1 ]; then
    return apt
  fi
}

get_packages() {
  APT_PACKAGES = g++ ripgrep
  DNF_PACKAGES = gcc-c++ ripgrep
  if [ $(command -v dnf | wc -l) = 1 ]; then
    return $DNF_PACKAGES
  fi

  if [ $(command -v apt | wc -l) = 1 ]; then
    return $APT_PACKAGES
  fi
}

OS_PACKAGER = get_os_packager()
PACKAGES = get_packages()
$($OS_PACKAGER install -y $PACKAGES)

if [ $(command -v dnf | wc -l) = 1 ]; then
  echo "Installing deps on Fedora"
  sudo dnf install gcc-c++ ripgrep -y &> /dev/null
fi

if [ $(command -v apt | wc -l) = 1 ]; then
  echo "Installing deps on Ubuntu"
  sudo apt install g++ ripgrep -y &> /dev/null
fi

# Fonts
if [ $(ls /usr/share/fonts | grep -e "FiraCodeNerdFont" | wc -l) = 0 ]; then
  echo "Installing FiraCode font"
  wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/FiraCode.zip
  unzip FiraCode.zip
  sudo mv *.ttf /usr/share/fonts/
  sudo rm LICENSE
  sudo rm readme.md
  sudo rm FiraCode.zip
fi

# Packer
PACKER_FILEPATH=~/.local/share/nvim/site/pack/packer/start/packer.nvim
if [ ! -e $PACKER_FILEPATH ]; then
  echo "Installing packer for nvim"
  git clone --depth 1 https://github.com/wbthomason/packer.nvim\
    $PACKER_FILEPATH
fi

# Go
USER_LOCAL=/usr/local
if [ ! -d $USER_LOCAL/go ]; then
  echo "Installing Go"
  wget https://go.dev/dl/go$GOVERSION.linux-amd64.tar.gz
  sudo rm -rf $USER_LOCAL/go && sudo tar -C $USER_LOCAL -xzf go$GOVERSION.linux-amd64.tar.gz

  if [ $(cat $USED_SHELL_FILEPATH | grep -e "/usr/local/go/bin" | wc -l) = 0 ]; then
    echo "export PATH=$PATH:/usr/local/go/bin" >> $USED_SHELL_FILEPATH
  fi
fi

if [ $(command -v nvm | wc -l) = 0 ]; then
  echo "Installing nvm"
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash > /dev/null
  source $USED_SHELL_FILEPATH
fi

# Node
if [ $(command -v node | wc -l) = 0 ]; then
  echo "Installing node"
  nvm install $NODE_VERSION
  npm install -g typescript typescript-language-server neovim
fi

#PHP
if [ $(command -v php | wc -l) = 0 ]; then
  echo "Installing PHP"
  $($OS_PACKAGER install -y php &> /dev/null)
fi

if [ $(command -v composer | wc -l) = 0 ]; then
  echo "Installing composer"
  php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
  php -r "if (hash_file('sha384', 'composer-setup.php') === 'e21205b207c3ff031906575712edab6f13eb0b361f2085f1f1237b7126d785e826a450292b6cfd1d64d92e6563bbde02') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
  php composer-setup.php
  php -r "unlink('composer-setup.php');"

  sudo mv composer.phar /usr/local/bin/composer
fi
