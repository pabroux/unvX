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
			(lib.strings.concatLines
				(map 
					(x: 
						"(
							PATH=/opt/homebrew/bin:$PATH
							HOMEBREW_NO_ENV_HINTS=1
							brew install --quiet --cask ${x} > /dev/null
			 			 )"
					)
					casks
				)
			);
	};
}
