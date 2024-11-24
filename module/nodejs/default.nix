{ config, pkgs, ... }:

{
	home.packages = [
		pkgs.nodePackages_latest.nodejs
	];
}
