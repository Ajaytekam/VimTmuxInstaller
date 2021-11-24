#!/bin/bash 

path=`echo ~`"/" 
# install vim8.2 and tmux
echo -e "\e[32m[+] Installing tmux and vim  \e[0m"
apt update -y
apt install tmux -y 
apt install figlet 
apt install toilet   
apt-get install -y software-properties-common
rm -rf /var/lib/apt/lists/*
add-apt-repository ppa:jonathonf/vim
apt update -y
apt install vim -y
apt install ctags  
# create .vim if not exists  
[ ! -d $path".vim" ] && mkdir $path".vim" 

# extracting templates file and copy vimrc and tmux file 
cp templates.tar $path".vim"  
cp .vimrc $path
cp .tmux.conf $path 
cd $path".vim"  
echo -e "\e[32m[+] Extracting template files  \e[0m"
tar -xvf templates.tar  
rm templates.tar  


# install plugin manager
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install nodejs for coc.vim 
echo -e "\e[32m[+] Installing Node.js for COC.vim  \e[0m"
curl -fsSL https://deb.nodesource.com/setup_17.x | sudo -E bash -
sudo apt-get install -y nodejs
echo -e "\e[32m[+] Installation Complete!\e[0m"
