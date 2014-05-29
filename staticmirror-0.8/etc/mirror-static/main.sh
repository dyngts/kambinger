## Credit to childadx
## https://github.com/chilladx/config-parser

#!/bin/bash

##include config parser
source /etc/mirror-static/config-parser.sh

## parse the configuration file
config_parser "/etc/mirror-static/config";

## load <my_section> from the ini file
## then call the generator of each generated page

config.section.home;
source $generator

config.section.mirror;
source $generator

config.section.alternative;
source $generator

config.section.faq;
source $generator

config.section.contact;
source $generator
