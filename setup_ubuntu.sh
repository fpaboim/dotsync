#!/bin/sh
cd ~

# Other Repositories
sudo add-apt-repository ppa:webupd8team/sublime-text-2

# Update & Upgrade #
sudo apt-get update
sudo apt-get upgrade -y

# REMOVE some unneeded apps #
sudo apt-get remove gnome-games gnome-games-common empathy

# INSTALL new apps #
sudo apt-get -y install \
git \
git-core \
vim \
build-essential \
curl \
xclip \
guake \
rar \
unrar \
zip \
unzip \
gimp \
exuberant-ctags \
make \
automake \
cmake \
autoconf \
ruby 1.9.3 \
rubygems \
lua5.1 \
chromium-browser \
sublime-text-2 \
zsh

curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

# Setup Git
git config --global user.name fpaboim
git config --global user.email fr4n@hotmail.com

# Dotsync setup
if [ ! -d "~/.dotfiles" ]; then
  git clone https://github.com/fpaboim/dotsync.git .dotfiles/
else
  cd ~/.dotfiles
  git pull
  cd .. 
fi
~/.dotfiles/dotsync/bin/dotsync -L
sudo sh ~/.dotfiles/dropsub.sh

# Dropbox
wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf - 

# Setup SSH
if [ ! -d "~/.ssh" ]; then
  mkdir ~/.ssh/
fi
ssh-keygen -t rsa -C "fr4n@hotmail.com"
ssh-add ~/.ssh/id_rsa.pub
clip < ~/.ssh/id_rsa.pub
echo "Key copied to clipboard, now paste it in github!"

# Cleanup
sudo apt-get -y --force-yes clean
sudo apt-get -y --force-yes autoclean
sudo apt-get -y --force-yes autoremove
