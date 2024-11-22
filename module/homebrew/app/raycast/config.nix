"echo -n 'Do you want to import raycast config? [y/n]: '
read -r REPLY
if [[ $REPLY =~ ^[Yy]$ ]]; then
	/usr/bin/open ${toString (./. + "/raycast.rayconfig")}
fi"
