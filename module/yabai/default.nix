{ config, pkgs, lib, ... }:

{
	home.packages = [
		pkgs.yabai
	];
	
	home.file = {
		"yabairc" = {
			source = config.lib.file.mkOutOfStoreSymlink ./yabairc;
			target = ".config/yabai/yabairc";
		};
	};

	home.activation = {
		setupYabai = lib.hm.dag.entryAfter ["writeBoundary"] 
		("echo -n 'Do you want to setup the yabai scripting addition (superuser privileges required)? [y/n]: '
		read -r REPLY
		[ ! -t 0 ] && echo
		if [[ $REPLY =~ ^[Yy]$ ]]; then
			echo \"$(/usr/bin/whoami) ALL=(root) NOPASSWD: sha256:$(/usr/bin/shasum -a 256 $(/bin/realpath $HOME)/.nix-profile/bin/yabai | /usr/bin/cut -d ' ' -f 1) $(/bin/realpath $HOME)/.nix-profile/bin/yabai --load-sa\" | /usr/bin/sudo /usr/bin/tee /private/etc/sudoers.d/yabai > /dev/null
		fi");
	};
}
