{ config, pkgs, lib, ... }:

{
	home.activation = {
		setupMiniconda = lib.hm.dag.entryAfter ["installHomebrewCasks"]
		("/opt/homebrew/bin/conda config --set auto_activate_base false
		/opt/homebrew/bin/conda config --set changeps1 false");
	};
}
