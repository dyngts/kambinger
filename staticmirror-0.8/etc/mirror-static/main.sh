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
source $generator

config.section.alternative;
source $generator

config.section.faq;
source $generator
