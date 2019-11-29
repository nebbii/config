#!/bin/sh

# install programs
# missing: google-chrome, discord, slack, phpstorm etc
sudo apt-get -y install i3 cmus feh arandr vim curl git screenfetch compton thunderbird kolourpaint pavucontrol redshift ctags cscope ibus-anthy

# libraries for dumb stuff
sudo apt-get -y install libev-dev libxcb-composite0 libxcb-composite0-dev libxcb-xinerama0 libxcb-randr0 libxcb-xinerama0-dev libxcb-xkb-dev libxcb-image0-dev libxcb-util-dev libxkbcommon-x11-dev libjpeg-turbo8-dev libpam0g-dev libfftw3-dev libncursesw5-dev cmake libpulse-dev

git submodules update --init

# vim plugins
if [ ! -d "~/.vim/bundle/Vundle.vim" ] ; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

# dotfiles
mkdir -p ~/.config/i3
sudo cp i3config ~/.config/i3/config
sudo cp i3status.conf /etc/i3status.conf
sudo cp bashrc ~/.bashrc
sudo cp bash_aliases ~/.bash_aliases 
sudo cp vimrc ~/.vimrc

# binaries
#sudo cp clip /usr/bin/

# fonts
sudo apt install xfonts-terminus

git config --global user.email "ben.wolthuis@gmail.com"
git config --global user.name "Ben"
