#!/bin/bash 
##############################
#制作人:程姚根
#修改:王涵
##############################

#备份OS中vim的配置   
function bakup_vimconfig()
{
	echo "Bakup your vimconfig file..."
	rm   -rf $HOME/.bakvim
	mkdir $HOME/.bakvim
	cp 	  $HOME/.vim  $HOME/.bakvim -a 
	cp 	  $HOME/.vimrc $HOME/.bakvim 
}

#配置vim
function config_vim()
{
	echo "Config your vim now !"
	rm -rf $HOME/.vim 
	cp ./vimrc $HOME/.vimrc 
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

#主函数
function main()
{
	sudo apt install ctags cscope vim-nox vim-gtk3
	bakup_vimconfig
	config_vim
}

#执行脚本
main
