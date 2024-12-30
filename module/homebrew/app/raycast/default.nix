{ config, pkgs, lib, ... }:

{
	home.activation = {
		setupRaycast = lib.hm.dag.entryAfter ["installHomebrewCasks"]
			"(
				PATH=/usr/bin:$PATH
		  		echo -n 'Do you want to import raycast config? [y/n]: '
		  		read -r REPLY
		  		[ ! -t 0 ] && echo
		  		if [[ $REPLY =~ ^[Yy]$ ]]; then
		  			open ${toString (./. + "/raycast.rayconfig")}
		  		fi
			 )";
	};
}
