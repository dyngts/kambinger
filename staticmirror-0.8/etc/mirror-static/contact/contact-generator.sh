#!/bin/bash
##include config parser
source /etc/mirror-static/config-parser.sh

## parse the configuration file
config_parser "/etc/mirror-static/config";
config.section.main;
#echo $base_url;
#echo $base_path

num=1
while read line
do
	#lower=`echo ${line,,}`
	#name=`echo ${lower// /_}`
	#cho $line
	name=`echo $line | cut -d = -f 1`
	link=`echo $line | cut -d = -f 2`
	
	#link="$base_url/$name/"
	#filelink="$name $link"
	filelink="<tr><td style='color:black'>$num</td><td style='color:black'>$name</td> <td><a href='$link'>$link</a></td> <td><a href='$link'>$link</a></td> </tr>"
	echo $filelink
	#echo $num
	num=$(($num + 1))
done < /etc/mirror-static/mirror/mirror-list.txt > /etc/mirror-static/mirror/generated.txt

result=`sed -e '/<!--generated part starts-->/r/etc/mirror-static/mirror/generated.txt' /etc/mirror-static/mirror/mirror-template.html`


echo $result> $base_path/mirror.html
