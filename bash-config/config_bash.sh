#!/bin/bash
#配置命令提示符和git插件的脚本

cp ./git-completion.bash ~/.git-completion.bash
cp ./git-prompt.sh ~/.git-prompt.sh

tail -n 8 ./bashrc >> ~/.bashrc
source ~/.bashrc
