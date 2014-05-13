#!/bin/bash
generated=""
while read line
do
	lower=`echo ${line,,}`
	name=`echo ${lower// /_}`
	link="kambing.ui.ac.id/$name/"
	filelink="<li><a href='$link'>$line</a> - <a href='ftp://$link'>FTP</a></li>"
	echo $filelink
	
done < ./daftarnama.txt > ./generated.txt

result=`sed -e '/<!--generated links-->/r./generated.txt' ./template.html`

echo $result>./generatedhtml.html

echo "$(date): cron job run" >> ./test.log
