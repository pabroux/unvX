{ config, pkgs, lib, ... }:

let
	casks = [
		"discord"
		"docker"
		"edrawmind"
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
	home.activation = {
		installHomebrewCasks = lib.hm.dag.entryAfter ["writeBoundary"] 
		(lib.strings.concatLines (map (x: "/opt/homebrew/bin/brew install --cask " + x) casks));
		setupHomebrewCasks = lib.hm.dag.entryAfter ["installHomebrewCasks"]
		(lib.strings.concatLines (map (x: import x) (builtins.filter (x: builtins.pathExists x) (map (x: toString (./. + ("/app/" + x + "/config.nix"))) casks))));
	};
}
