#!/bin/bash

if [ -z '$(who | grep "root")'] 
then 
	echo "This script need root"
	exit
fi

if [ -z "$(lsb_release -a | grep -i "ubuntu")" ]
then 
	apt-get update
	apt-get install -y vim
	apt-get install -y tig
fi 

./bash-config/config_bash.sh
./vim-config/vim_config.sh



