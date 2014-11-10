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
#	vim ctags cscope taglist a.vim
#		wget cscope.sourceforge.net/cscope_maps.vim -O cscope_maps.vim
#		wget http://www.vim.org/scripts/download_script.php?src_id=7218 -O a.vim
#       wget http://vim.sourceforge.net/scripts/download_script.php?src_id=6416 -O taglist_42.zip
#
#	g++
#	git subversion
#	tree
#
# network tools:
#	bind traceroute
#	server:
# sudo apt-get install openbsd-inetd
# sudo apt-get install tasksel
# sudo apt-get update
# sudo tasksel install lamp-server
#	re-direct default www --> /etc/apache2/sites-available/000-default.conf
# sudo apt-get install wireshark
#   sudo chmod a+s /usr/bin/dumpcap
#
# Android develop:
#	adt-bundle-linux.zip (developer.andorid.com download)
#	openjdk-7-jdk
#   g++-multilib libc6-dev-i386
#	lib32stdc++6 lib32z1 lib32ncurses5
