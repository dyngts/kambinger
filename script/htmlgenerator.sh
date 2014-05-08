#!/bin/bash
generated=""
while read line
do
	lower=`echo ${line,,}`
	name=`echo ${lower// /_}`
	link="kambing.ui.ac.id/$name/"
	filelink="<li><a href='$link'>$line</a> - <a href='ftp://$link'>FTP</a></li>"
	echo $filelink
	
done < /home/firauxa/Documents/daftarnama.txt > /home/firauxa/Documents/generated.txt

result=`sed -e '/<!--generated links-->/r/home/firauxa/Documents/generated.txt' /home/firauxa/Documents/template.html`

echo $result>/home/firauxa/Documents/generatedhtml.html

echo "$(date): cron job run" >> /home/firauxa/Documents/test.log
