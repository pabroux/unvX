"echo -n 'Do you want to import raycast config? [y/n]: '
read -r REPLY
[ ! -t 0 ] && echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
	/usr/bin/open ${toString (./. + "/raycast.rayconfig")}
fi
"
