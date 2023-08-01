#!/bin/zsh

USED_SHELL_FILEPATH=~/.zshrc
NODE_VERSION=18
GOVERSION=1.20.7

if [ $(command -v dnf | wc -l) = 1 ]; then
  echo "Installing deps on Fedora"
  sudo dnf install gcc-c++ -y &> /dev/null
fi

if [ $(command -v apt | wc -l) = 1 ]; then
  echo "Installing deps on Ubuntu"
  sudo apt install g++ -y &> /dev/null
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
