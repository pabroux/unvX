{
  config,
  pkgs,
  unvX,
  ...
}: let
  linkFile = files:
    builtins.listToAttrs (map (file: {
        name = "claude/${file}";
        value = {
          source = config.lib.file.mkOutOfStoreSymlink "${unvX.directory.module}/claude/${file}";
          target = ".config/claude/${file}";
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
    pkgs.claude-code
    pkgs.rtk
  ];

  nixpkgs.config.allowUnfreePackages = [
    "claude-code"
  ];

  home.file =
    linkFile [
      "settings.json"
    ]
    // linkDir "agents"
    // linkDir "skills";
}
