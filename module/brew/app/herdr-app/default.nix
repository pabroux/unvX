{
  config,
  pkgs,
  lib,
  unvx,
  ...
}: let
  linkFile = files:
    builtins.listToAttrs (map (file: {
        name = "herdr-app/${file}";
        value = {
          source = config.lib.file.mkOutOfStoreSymlink "${unvx.directory.module}/brew/app/herdr-app/${file}";
          target = ".config/herdr-app/${file}";
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
  home.file =
    linkFile [
      "keys.json"
      "settings.json"
    ]
    // linkDir "themes";
}
