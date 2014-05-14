#!/bin/bash
num=1
while read line
do
	#lower=`echo ${line,,}`
	#name=`echo ${lower// /_}`
	#cho $line
	name=`echo $line | cut -d = -f 1`
	link=`echo $line | cut -d = -f 2`
	
	#link="kambing.ui.ac.id/$name/"
	filelink="$name $link"
	filelink="<tr><td style='color:black'>$num</td><td style='color:black'>$name</td> <td><a href='$link'>$link</a></td> <td><a href='$link'>$link</a></td> </tr>"
	echo $filelink
	#echo $num
	num=$(($num + 1))
done < ./mirror-list.txt > ./generated.txt

result=`sed -e '/<!--generated part starts-->/r./generated.txt' ./mirror-template.html`

echo $result>./generatedhtml.html

echo "$(date): cron job runs" >> ./test.log
