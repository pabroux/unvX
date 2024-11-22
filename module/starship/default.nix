{ config, pkgs, ... }:

{
	home.packages = [
		pkgs.starship
	];
	
	home.file = {
		"starship.toml" = {
			source = config.lib.file.mkOutOfStoreSymlink ./starship.toml;
			target = ".config/starship.toml";
		};
	};
}
