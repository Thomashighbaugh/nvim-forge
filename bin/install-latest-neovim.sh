#!/bin/bash

RED="$(printf '\033[31m')" GREEN="$(printf '\033[32m')" ORANGE="$(printf '\033[33m')" BLUE="$(printf '\033[34m')"
MAGENTA="$(printf '\033[35m')" CYAN="$(printf '\033[36m')" WHITE="$(printf '\033[37m')" BLACK="$(printf '\033[30m')"
REDBG="$(printf '\033[41m')" GREENBG="$(printf '\033[42m')" ORANGEBG="$(printf '\033[43m')" BLUEBG="$(printf '\033[44m')"
MAGENTABG="$(printf '\033[45m')" CYANBG="$(printf '\033[46m')" WHITEBG="$(printf '\033[47m')" BLACKBG="$(printf '\033[40m')"

# Banner 
clear 
cat << _EOF_

	${GREEN}┌─────────────────────────────────────────────────────────────────────────────┐
	│  ${ORANGE}  _______               ___ ___ __             ______    ______            ${GREEN}│
	│  ${ORANGE} |    |  |.-----.-----.|   |   |__|.--------. |      |  |    __|           ${GREEN}│
	│  ${ORANGE} |       ||  -__|  _  ||   |   |  ||        | |  --  |__|__    |           ${GREEN}│
	│  ${ORANGE} |__|____||_____|_____| \_____/|__||__|__|__| |______|__|______|           ${GREEN}│
	└─────────────────────────────────────────────────────────────────────────────┘                                                                  
_EOF_
# NeoVim Bleeding Edge
git clone --branch master --depth 1 https://github.com/neovim/neovim

cd neovim

sudo make CMAKE_BUILD_TYPE=Release install

cd ~

sudo rm -r neovim

# Dependency Install 
if command -v pacman &> /dev/null
then

echo ${GREEN} "Dependency Installation"
    sudo pacman -S python-pynvim python-pip python2-pip nodejs ruby-gems
    pip install neovim pynvim --user
    pip2 install neovim pynvim --user
    gem install neovim
    sudo npm i -g neovim
    echo ${GREEN} "Make sure your Ruby Gems are being installed on your Path, or adjust the system accordingly to use the Ruby Provider."
else
  echo ${RED} "Non-Pacman system detected, you will have to install dependencies on your own. Sorry."

fi

echo ${GREEN} "NeoVim's Bleeding Edge has been installed, you are now ready to install the configuration itself"
