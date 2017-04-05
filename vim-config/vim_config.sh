#!/bin/bash

cat ./vimrc >> /etc/vim/vimrc
tar -zxvf ./vimcdoc-1.8.0.tar.gz 
cd ./vimcdoc-1.8.0 && ./vimcdoc.sh -i && cd .. && rm -rf ./vimcdoc-1.8.0

if test -n "$(lsb_release -a | grep -i "ubuntu")"
then
	echo "install cscope"
	apt-get install -y cscope
fi




