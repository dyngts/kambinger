#!/bin/bash
##include config parser
source /etc/mirror-static/config-parser.sh

## parse the configuration file
config_parser "/etc/mirror-static/config";
config.section.main;
config.section.faq;

#for numbering purpose
num=1

#loop every line
while read line
do
	#parse each line with semi colon
	#format--> <question>;<answer>
	#write answer with html formatting as needed: <b></b>,<i></i>, <a></a>,etc
	question=`echo $line | cut -d ';' -f 1`
	answer=`echo $line | cut -d ';' -f 2`
	
	#template for repeated list part in template file	
	ques="<li><div class='accordion-group'><div class='accordion-heading'><span class='accordion-toggle alert alert-error' data-toggle='collapse' data-parent='#accordion2' href='#collapse$num'>$question</span></div>"
    ans="<div id='collapse$num' class='accordion-body collapse'><div class='accordion-inner'>$answer</div></div></div></li>"
    filelink=$ques$ans
	echo $filelink
	
	#increase numbering
	num=$(($num + 1))
done < $list > /etc/mirror-static/faq/generated.txt

#write the generated part into template and create new file in base_path
result=`sed -e '/<!--generated part starts-->/r/etc/mirror-static/faq/generated.txt' $template`
echo $result> $base_path/$output
