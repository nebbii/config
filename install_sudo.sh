# install programs
# missing: google-chrome, discord
sudo apt install i3 cmus feh arandr vim curl git screenfetch compton thunderbird 

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
