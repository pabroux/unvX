{
  config,
  pkgs,
  lib,
  unvX,
  ...
}: let
  linkFile = files:
    builtins.listToAttrs (map (file: {
        name = "nvim/${file}";
        value = {
          source = config.lib.file.mkOutOfStoreSymlink "${unvX.directory.module}/nvim/${file}";
          target = ".config/nvim/${file}";
        };
      })
      files);

  linkDir = directory: let
    entries = builtins.readDir (./. + "/${directory}");
  in
    builtins.foldl' (
      links: entry:
        links
        // (
          if entries.${entry} == "directory"
          then linkDir "${directory}/${entry}"
          else linkFile ["${directory}/${entry}"]
        )
    ) {}
    (builtins.attrNames entries);
in {
  home.packages = [
    pkgs.neovim
    pkgs.nodejs
  ];

  home.file =
    linkFile [
      "init.lua"
      "lazy-lock.json"
      "lazyvim.json"
    ]
    // linkDir "lua/config"
    // linkDir "lua/plugins";

  home.activation = {
    installNeovimPlugins =
      lib.hm.dag.entryAfter ["installPackages" "linkGeneration"]
      "(
        PATH=${lib.makeBinPath [pkgs.git]}:$HOME/.nix-profile/bin:$PATH
        if [[ -v DRY_RUN ]]; then
          echo \"nvim --headless '+Lazy! install' '+Lazy! restore' +qa &> /dev/null\"
        elif [[ -v VERBOSE ]]; then
          nvim --headless '+Lazy! install' '+Lazy! restore' +qa
        else
          nvim --headless '+Lazy! install' '+Lazy! restore' +qa &> /dev/null
        fi
      )";
  };
}
