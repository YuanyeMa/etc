#此脚本主要完成将windows平台下GBK编码的源码文件转换为Linux下的UTF-8编码文件
#!/bin/bash

judge(){
	if [ $? = '0'  ] ; then 
    		echo "$P conv success"
	else 
		echo "[0;31m $P conv failed [0m"
	fi
}

usage(){
	echo "usage : conv.sh dirname"
	echo "	dirname is the directory will be converted"
	echo "	after convent finished , dirname-UTF-8 directory will be created"
}


if [  $# != 2 ] || [  -z $1 ] ; then 
	usage
	exit
fi

DIR=$1

if [ -d $DIR ]; then 
	TARDIR=`echo "${DIR}" | sed 's/\/$//'`
	
	if [ -z $TARDIR ]; then 
		echo "TAR null"
	else 
		TAR=$TARDIR-UTF-8
		if [ -d $TAR ]; then 
			echo "$TAR already exits"
			exit
		fi
	fi
else 
	usage
	exit
fi

echo "cp $DIR to $TAR"
cp -rp $DIR $TAR

exit

for INDEX in "*.c" "*.h" "*.sh" "makefile"
do
	for P in $(find $TAR -iname $INDEX)
	do
		#是dos就转换为unix format
		if [ -n "$(file $P | grep "CRLF")" ] ; then 
			dos2unix $P 
		fi

		#是GBK就转换为utf-8 format
		if [ -n "$(file $P | grep "ISO")" ] ; then 
			iconv -f GBK -t UTF-8 $P -o $P
			judge
		fi
	done
done
