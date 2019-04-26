# install programs
# missing: google-chrome, discord, slack, phpstorm etc
sudo apt-get -y install i3 cmus feh arandr vim curl git screenfetch compton thunderbird kolourpaint pavucontrol redshift ctags cscope 

# libraries for dumb stuff
sudo apt-get -y install libev-dev libxcb-composite0 libxcb-composite0-dev libxcb-xinerama0 libxcb-randr0 libxcb-xinerama0-dev libxcb-xkb-dev libxcb-image0-dev libxcb-util-dev libxkbcommon-x11-dev libjpeg-turbo8-dev libpam0g-dev libfftw3-dev libncursesw5-dev cmake libpulse-dev

# vim plugins
git submodules init
git pull --recursive-submodules
rsync --progress vimplugins/* ~/.vim

# config file placement
mkdir ~/.config/i3
sudo cp i3config ~/.config/i3/config
sudo cp i3status.conf /etc/i3status.conf
sudo cp bashrc ~/.bashrc
sudo cp bash_aliases ~/.bash_aliases 
sudo cp vimrc ~/.vimrc

# fonts
sudo apt install xfonts-terminus

git config --global user.email "ben.wolthuis@gmail.com"
git config --global user.name "Ben"
