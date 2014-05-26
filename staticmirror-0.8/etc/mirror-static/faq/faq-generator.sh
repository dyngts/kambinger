#!/bin/bash
##include config parser
source /etc/mirror-static/config-parser.sh

## parse the configuration file
config_parser "/etc/mirror-static/config";
config.section.main;
#base=$base_path;
config.section.faq;
#echo $base_url;
#echo $base_path

num=1
while read line
do
	#lower=`echo ${line,,}`
	#name=`echo ${lower// /_}`
	#cho $line
	question=`echo $line | cut -d ';' -f 1`
	answer=`echo $line | cut -d ';' -f 2`
	
	#link="$base_url/$name/"
	#filelink="$name $link"
	ques="<li><div class='accordion-group'><div class='accordion-heading'><span class='accordion-toggle alert alert-error' data-toggle='collapse' data-parent='#accordion2' href='#collapse$num'>$question</span></div>"
    ans="<div id='collapse$num' class='accordion-body collapse'><div class='accordion-inner'>$answer</div></div></div></li>"
    filelink=$ques$ans
	echo $filelink
	#echo $num
	num=$(($num + 1))
done < $list > /etc/mirror-static/faq/generated.txt

result=`sed -e '/<!--generated part starts-->/r/etc/mirror-static/faq/generated.txt' $template`


echo $result> $base_path/$output
