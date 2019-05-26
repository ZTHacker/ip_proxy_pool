#!/bin/bash
FILENAME=verified.txt

function While_read_LINE(){
#读取行内容
cat logo
cat $FILENAME | while read myline
do

	index=0
	for i in $(echo $myline | awk -F '|' '{print $2,$3}')
	do
		arr[$index]=$i
		let "index+=1"
	done
	ip=${arr[0]}
	port=${arr[1]}
	echo $ip
	echo $port

	#设置系统http代理，并设置手动
	gsettings set org.gnome.system.proxy.http host $ip
        gsettings set org.gnome.system.proxy.http port $port
        gsettings set org.gnome.system.proxy mode 'manual'

	#设置系统https代理
        gsettings set org.gnome.system.proxy.https host $ip
	gsettings set org.gnome.system.proxy.https port $port

	#若想在系统范围内使用，在前面加上sudo

	#设置ftp代理
	#gsettings set org.gnome.system.proxy.ftp host 'my.proxy.com'
        #gsettings set org.gnome.system.proxy.ftp port 8000


	#设置系统代理为自动
	#gsettings set org.gnome.system.proxy mode 'auto'
        #gsettings set org.gnome.system.proxy autoconfig-url http://my.proxy.com/autoproxy.pac


	#清除所有“手动/自动”代理设置，还原为无代理设置
	#gsettings set org.gnome.system.proxy mode 'none'


	#睡眠2分钟
	sleep 2m
done
}
While_read_LINE
