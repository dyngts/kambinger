#!/bin/bash
##include config parser
source /etc/mirror-static/config-parser.sh

## parse the configuration file
config_parser "/etc/mirror-static/config";
config.section.main;
config.section.home;

#loop every line
while read line
do
	#parse each line with semi colon
	#format--> <title>;<content>
	#write answer with html formatting as needed: <b></b>,<i></i>, <a></a>,etc
	title=`echo $line | cut -d ';' -f 1`
	content=`echo $line | cut -d ';' -f 2`
	
	#template for repeated list part in template file	
	titletag="<div class='page-header'><h3>$title</h3> </div>"
    filelink=$titletag$content
	echo $filelink

done < $list > /etc/mirror-static/home/generated.txt

#write the generated part into template and create new file in base_path
result=`sed -e '/<!--generated part starts-->/r/etc/mirror-static/home/generated.txt' $template`
echo $result> $base_path/$output
