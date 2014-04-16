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
#	vim ctags cscope taglist
#	g++
#	git subversion
#	tree
# network tools:
#	bind traceroute
#	server:
# sudo apt-get install tasksel
# sudo tasksel install lamp-server
#	re-direct default www --> /etc/apache2/sites-available/000-default.conf
# sudo apt-get update
# sudo tasksel install lamp-server
# Android develop:
#	adt-bundle-linux.zip (developer.andorid.com download)
#	openjdk-7-jdk

echo "start -- install vim"
apt-get install vim
echo "start -- install git"
apt-get install git
echo "start -- install g++"
apt-get install g++
echo "start -- install tree"
apt-get install tree

#sudo apt-get

