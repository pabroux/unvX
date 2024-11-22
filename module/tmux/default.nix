{ config, pkgs, ... }:

{
	home.packages = [
		pkgs.tmux
		pkgs.tmuxPlugins.resurrect
	];
	
	home.file = {
		".tmux.conf" = {
			source = config.lib.file.mkOutOfStoreSymlink ./.tmux.conf;
		};
	};
}
