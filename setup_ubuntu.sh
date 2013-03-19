#!/bin/sh
cd ~

# Other Repositories

# Update & Upgrade #
sudo apt-get update
sudo apt-get upgrade -y

# REMOVE some unneeded apps #
sudo apt-get remove gnome-games gnome-games-common empathy

# INSTALL new apps #
sudo apt-get -y install \
figlet \
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
zsh

# Setup RVM
if [ ! -d ~/.rvm ]; then
  echo "======================================================================"
  echo "Installing RVM"
  echo "======================================================================"
  \curl -#L https://get.rvm.io | bash -s stable --ruby
fi

# Setup Oh-my-zsh
if [ ! -d ~/.oh-my-zsh ]; then
  echo "======================================================================"
  echo "Installing Oh-my-zsh"
  echo "======================================================================"
  chsh -s /bin/zsh
  curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
fi

# Setup Git
git config --global user.name fpaboim
git config --global user.email fr4n@hotmail.com

# Dropbox Setup
if [ ! -d ~/.dropbox-dist ]; then
  echo "======================================================================"
  echo "Installing Dropbox"
  echo "======================================================================"
  wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf - 
  ~/.dropbox-dist/dropboxd&
fi

# Dotsync setup
if [ ! -d ~/.dotfiles ]; then
  echo "======================================================================"
  echo "Configuring dotfiles with dotsync"
  echo "======================================================================"
  git clone https://github.com/fpaboim/dotsync.git .dotfiles/
  ~/.dotfiles/bin/dotsync -L
else
  cd ~/.dotfiles
  git pull
  cd .. 
 ~/.dotfiles/dotsync/bin/dotsync -u
fi

# Setup SSH
if [ ! -d ~/.ssh ]; then
  echo "======================================================================"
  echo "Creating SSH Key"
  echo "======================================================================"
  mkdir ~/.ssh/
  ssh-keygen -t rsa -C "fr4n@hotmail.com"
  ssh-add ~/.ssh/id_rsa.pub
  cat ~/.ssh/id_rsa.pub | xclip -selection c
  echo "Key copied to clipboard, now paste it in github!"
fi

# Setup sublime-text-2
if [ ! -d ~/.config/sublime-text-2 ]; then
  echo "======================================================================"
  echo "Installing Sublime Text"
  echo "======================================================================"
  sudo apt-get install sublime-text
  sublime-text --background --command exit
  sudo sh ~/.dotfiles/dropsub.sh
fi

# Setup VIM
if [ ! -d ~/.vim/bundle/vundle ]; then
  echo "======================================================================"
  echo "Installing Vundle"
  echo "======================================================================"
  git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
  vim +BundleInstall +qall
else
  vim +BundleUpdate +qall
fi

# Cleanup
sudo apt-get -y --force-yes clean
sudo apt-get -y --force-yes autoclean
sudo apt-get -y --force-yes autoremove
