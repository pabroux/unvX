{ config, pkgs, ... }:

{
	home.packages = [
		pkgs.skhd
	];
	
	home.file = {
		".skhdrc" = {
			source = config.lib.file.mkOutOfStoreSymlink ./.skhdrc;
		};
	};
}
