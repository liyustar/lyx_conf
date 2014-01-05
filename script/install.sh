#!/bin/bash

SOURCELIST=/etc/apt/sources.list
UBUNTU_CODE_12_04=precise
UBUNTU_CODE_NOW=raring

# 更新数据源
if [ ! -e $SOURCELIST.bk ]; then
	mv $SOURCELIST $SOURCELIST.bk
	sed "s/$UBUNTU_CODE_12_04/$UBUNTU_CODE_NOW/" ./source_list.t > $SOURCELIST
	apt-get update
	echo "star -- updata sources list done!"
fi

# install list:
#	vim ctags cscope
#	g++
#	git
#	tree
#	server:
# sudo apt-get install tasksel
# sudo tasksel install lamp-server
# sudo apt-get update
# sudo tasksel install lamp-server

echo "start -- install vim"
apt-get install vim
echo "start -- install git"
apt-get install git
echo "start -- install g++"
apt-get install g++
echo "start -- install tree"
apt-get install tree

#sudo apt-get

