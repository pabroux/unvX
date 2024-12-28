{ config, pkgs, lib, ... }:

let
	casks = [
		"discord"
		"docker"
		"edrawmind"
		"font-sf-mono"
		"ghostty"
		"gimp"
		"keepassxc"
		"linear-linear"
		"miniconda"
		"notion"
		"nvidia-geforce-now"
		"onyx"
		"raycast"
		"slack"
		"spotify"
		"sublime-text"
		"visual-studio-code"
		"whatsapp"
	];
in
{
	imports = builtins.filter (x: builtins.pathExists x) (map (x: ./. + "/app/${x}") casks);

	home.activation = {
		installHomebrewCasks = lib.hm.dag.entryAfter ["writeBoundary"] 
		(lib.strings.concatLines (map (x: "/opt/homebrew/bin/brew install --cask " + x) casks));
	};
}
