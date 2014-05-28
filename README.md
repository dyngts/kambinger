kambinger
=========

No Goat, Only Kambing

This is a static website generator for mirroring purpose.
Package includes:
/etc/cron.daily/ --> to update web page daily
/usr/local/sbin/generatemirror --> to update web page manually

/var/www/staticmirror/ --> base path for css, image, and html page

/etc/mirror-static/ --> where main script lies and folder of each page

> config --> global configuration for staticmirror
in config you may find these variables:
base_url
base_path
template (template page)
generator (script to generate page)
output (output file)

list(list of input; please mind the formatting)
contact(contact text will be converted into image, imagemagick required)
