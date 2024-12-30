{ config, pkgs, lib, ... }:

{
	home.activation = {
		setupMiniconda = lib.hm.dag.entryAfter ["installHomebrewCasks"]
			"(
				PATH=/opt/homebrew/bin:$PATH
				conda config --set auto_activate_base false
				conda config --set changeps1 false
			 )";
	};
}
