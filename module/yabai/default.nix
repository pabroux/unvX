{
  config,
  pkgs,
  lib,
  unvX,
  ...
}: {
  home.packages = [
    pkgs.yabai
  ];

  home.file = {
    "yabai/yabairc" = {
      source = config.lib.file.mkOutOfStoreSymlink "${unvX.directory.module}/yabai/yabairc";
      target = ".config/yabai/yabairc";
    };
  };

  home.activation = {
    setupYabai =
      lib.hm.dag.entryAfter ["writeBoundary"]
      "(
				PATH=$(realpath $HOME)/.nix-profile/bin:/usr/bin:/bin:$PATH
				echo -n 'Do you want to setup the yabai scripting addition (superuser privileges required)? [y/n]: '
				read -r reply
				[ ! -t 0 ] && echo
				if [[ $reply =~ ^[Yy]$ ]]; then
					if [[ -v DRY_RUN ]]; then
						echo 'echo \"$(whoami) ALL=(root) NOPASSWD: sha256:$(shasum -a 256 $(which yabai) | cut -d ' ' -f 1) $(which yabai) --load-sa\" | sudo tee /private/etc/sudoers.d/yabai > /dev/null'
					else
						echo \"$(whoami) ALL=(root) NOPASSWD: sha256:$(shasum -a 256 $(which yabai) | cut -d ' ' -f 1) $(which yabai) --load-sa\" | sudo tee /private/etc/sudoers.d/yabai > /dev/null
					fi
				fi
			 )";
  };
}
