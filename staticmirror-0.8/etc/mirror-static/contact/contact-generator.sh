#!/bin/bash
##include config parser
source /etc/mirror-static/config-parser.sh

## parse the configuration file
config_parser "/etc/mirror-static/config";
config.section.main;
#base=$base_path;
config.section.contact;
#echo $base_url;
#echo $base_path


`convert -size 560x85 xc:transparent -font Palatino-Bold -pointsize 36 -fill black -draw "text 20,55 '$contact'" $image`
filelink="<img src='$image' height='50' width='320' class='img'> "
echo $filelink > /etc/mirror-static/contact/generated.txt

result=`sed -e '/<!--generated part starts-->/r/etc/mirror-static/contact/generated.txt' $template`


echo $result> $base_path/$output
