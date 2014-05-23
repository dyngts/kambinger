#!/bin/bash
##include config parser
source /etc/mirror-static/config-parser.sh

## parse the configuration file
config_parser "/etc/mirror-static/config";
config.section.alternative;
#echo $base_url;
#echo $base_path

num=1
while read line
do
	#lower=`echo ${line,,}`
	#name=`echo ${lower// /_}`
	#cho $line
	name=`echo $line | cut -d ; -f 1`
	link=`echo $line | cut -d ; -f 2`
	info=`echo $line | cut -d ; -f 3`
	
	#link="$base_url/$name/"
	#filelink="$name $link"
	filelink="<tr><td style='color:black'>$num</td> <td style='color:black'>$name</td><td style='color:black'><a href='$link'>http://bebas.vLSM.org/</a></td><td style='color:black'>$info</td></tr>"
	#echo $filelink
	#echo $num
	num=$(($num + 1))
done < $list > /etc/mirror-static/alternative/generated.txt

result=`sed -e '/<!--generated part starts-->/r/etc/mirror-static/mirror/generated.txt' $template`


echo $result> $base_path/$output
