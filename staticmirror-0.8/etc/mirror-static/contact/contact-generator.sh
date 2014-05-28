#!/bin/bash
##include config parser
source /etc/mirror-static/config-parser.sh

## parse the configuration file
config_parser "/etc/mirror-static/config";
config.section.main;
config.section.contact;

#call convert command from imgaemagick to convert contact into image
`convert -size 560x85 xc:transparent -font Palatino-Bold -pointsize 36 -fill black -draw "text 20,55 '$contact'" $image`

#put generated image in template
filelink="<img src='$image' height='50' width='320' class='img'> "
echo $filelink > /etc/mirror-static/contact/generated.txt

#write the generated part into template and create new file in base_path
result=`sed -e '/<!--generated part starts-->/r/etc/mirror-static/contact/generated.txt' $template`
echo $result> $base_path/$output
