#!/bin/bash
##include config parser
source /etc/mirror-static/config-parser.sh

## parse the configuration file
config_parser "/etc/mirror-static/config";
config.section.main;
config.section.mirror

#for numbering purpose
num=1

#loop every line
while read line
do
	#parse each line with semi colon
	#format--> <name>;<link>
	name=`echo $line | cut -d ';' -f 1`
	link=`echo $line | cut -d ';' -f 2`
	
	#template for repeated list part in template file
	filelink="<tr><td style='color:black'>$num</td><td style='color:black'>$name</td> <td><a href='$link'>$link</a></td> <td><a href='$link'>$link</a></td> </tr>"
	echo $filelink
	
	#increase numbering
	num=$(($num + 1))
done < $list > /etc/mirror-static/mirror/generated.txt

#write the generated part into template and create new file in base_path
result=`sed -e '/<!--generated part starts-->/r/etc/mirror-static/mirror/generated.txt' $template`
echo $result> $base_path/$output
