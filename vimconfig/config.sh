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
	cp ./.vim  $HOME -a 
	cp ./.vimrc $HOME 

	#生成tags文件
	echo "Make tags in /usr/include"
	cd /usr/include
	sudo ctags -I __THROW -I __THROWNL -I __nonnull -R --c-kinds=+p --fields=+iaS --extra=+q
}

#主函数
function main()
{
	sudo apt-get install ctags cscope
	bakup_vimconfig
	config_vim
}

#执行脚本
main
