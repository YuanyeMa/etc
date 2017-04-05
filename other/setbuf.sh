#!/bin/bash
#此脚本用于设置ubuntu的桌面分辨率为1920×1080，针对其他分辨率可以只用cvt 1920 1080命令生成Modeline,然后替换xrandr命令后边的newmode就行
#本来这些设置可以在xorg.conf文件中进行配置，但是对xorg.conf不熟悉，出错不会解决，然后就将此脚本写入了~/.profile 在用户登录的时候调用
xrandr --newmode "1920x1080_60.00"  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
xrandr --addmode Virtual1 "1920x1080_60.00"
xrandr --output Virtual1 --mode "1920x1080_60.00"
