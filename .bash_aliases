alias clip='scrot -s ~/.scrotclippa.png && xclip -selection c -t image/png -i ~/.scrotclippa.png && rm ~/.scrotclippa.png'
alias bashrc='vim ~/.bashrc'
alias ITSSHOWTIME='php bin/console server:run'
alias fuckgoback='git reset --hard HEAD~'
alias meleebich='~/Documents/FMv5.9/launch-fm'

# Aliases
alias vim='nvim'
alias lynx='lynx -accept-all-cookies -trace'

alias untar="tar -xvzf"
alias search="find . -name"

# Git
alias gca='git commit -a'
alias gcm='git commit -m'
alias gcam='git commit -am'
alias gls='git status'

# General
alias lsa='ls -l -a'

# Docker
alias docker='sudo docker'
alias dcup='docker-compose up'
alias dcdown='docker-compose down'

# Gamepoint
alias sshdevgamepoint='ssh bwolthuis@dev-fra01-eu.gamepoint.net'
alias sshbengp='ssh bwolthuis@172.31.23.74'
alias mountsshdev='sudo sshfs -o allow_other -o IdentityFile=/home/ben/.ssh/keys/id_rsa_bwolthuis bwolthuis@dev-fra01-eu.gamepoint.net:/home/bwolthuis /mnt/gpdev'
alias fpmbash='docker-compose exec php-fpm bash'
