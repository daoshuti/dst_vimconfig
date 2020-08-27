#!/bin/bash
# Author: wanghan
# Created Time : 2020年08月16日 12:14:35
# File Name: install.sh
# Description: install and reinstall dst_vimconfig


echo "Installing vim ..."
sudo apt install vim

echo "Installing ctags cscope ..."
sudo apt install ctags cscope

read -N 1 -p "Do you want delete old config?(y/n):" answer
echo ""
if [ $answer == "Y" -o $answer == "y" ]; then
	echo "Remove old vimcofnig ..."
	echo "Delete ~/.vim ..."
	rm -rf ~/.vim
	echo "Delete ~/.vimrc ..."
	rm -rf ~/.vimrc
fi

if [ -d ~/.vim -o -f ~/.vimrc ]; then
	echo "Install Failed!"
	echo "Please backup your ~/.vimrc and ~/.vim"
	exit 1
fi

echo "Link dst_vimconfig/imrc to ~/.vimrc ..."
ln -s ~/.dst_vimconfig/vimrc $HOME/.vimrc

echo "Installing vim-plug to ~/.vim/autoload/plug.vim ..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Installing dst_vimconfig/create_cscope.sh to ~/.vim/shell/create_cscope.sh ..."
mkdir -p ~/.vim/shell
cp ./create_cscope.sh ~/.vim/shell

echo "Installing vim plugins ..."
vim +PlugInstall

echo "Done."
