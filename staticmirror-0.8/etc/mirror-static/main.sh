## Credit to childadx
## https://github.com/chilladx/config-parser

#!/bin/bash

##include config parser
source /etc/mirror-static/config-parser.sh

## parse the configuration file
config_parser "/etc/mirror-static/config";

## load <my_section> from the ini file
#config.section.main;
#echo $base_url;
#echo $base_path

config.section.mirror;
echo $template;
echo $generator;
echo $list;

source /etc/mirror-static/mirror/mirror-generator.sh
