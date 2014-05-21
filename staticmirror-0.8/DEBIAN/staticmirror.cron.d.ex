#
# Regular cron jobs for the staticmirror package
#
0 4	* * *	root	[ -x /usr/bin/staticmirror_maintenance ] && /usr/bin/staticmirror_maintenance
