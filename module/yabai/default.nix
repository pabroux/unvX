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
			"(
				PATH=$(realpath $HOME)/.nix-profile/bin:/usr/bin:/bin:$PATH
				echo -n 'Do you want to setup the yabai scripting addition (superuser privileges required)? [y/n]: '
				read -r REPLY
				[ ! -t 0 ] && echo
				if [[ $REPLY =~ ^[Yy]$ ]]; then
					echo \"$(whoami) ALL=(root) NOPASSWD: sha256:$(shasum -a 256 $(which yabai) | cut -d ' ' -f 1) $(which yabai) --load-sa\" | sudo tee /private/etc/sudoers.d/yabai > /dev/null
				fi
			 )";
	};
}
