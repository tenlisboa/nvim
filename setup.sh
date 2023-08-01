#!/bin/bash

# Fonts
if [ $(ls /usr/share/fonts | grep -e "FiraCodeNerdFont" | wc -l) = 0 ]; then
  echo "Installing FiraCode font"
  wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/FiraCode.zip
  unzip FiraCode.zip
  sudo mv *.ttf /usr/share/fonts/
  sudo rm LICENSE.md
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
  GOVERSION="1.20.7"
  wget https://go.dev/dl/go$GOVERSION.linux-amd64.tar.gz
  sudo rm -rf $USER_LOCAL/go && sudo tar -C $USER_LOCAL -xzf go$GOVERSION.linux-amd64.tar.gz

  if [ $(cat ~/.zshrc | grep -e "/usr/local/go/bin" | wc -l) = 0 ]; then
    echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.zshrc
  fi
fi

#curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
#source ~/.bashrc
#nvm install 18
#npm install -g typescript typescript-language-server neovim
