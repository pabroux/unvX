{
  config,
  pkgs,
  lib,
  unvX,
  ...
}: {
  home.packages = [
    pkgs.claude-code
  ];

  home.file =
    {
      "claude/settings.json" = {
        source = config.lib.file.mkOutOfStoreSymlink "${unvX.directory.module}/claude-code/settings.json";
        target = ".config/claude/settings.json";
      };
    }
    // builtins.listToAttrs (map (agent: {
        name = "claude/agents/${agent}";
        value = {
          source = config.lib.file.mkOutOfStoreSymlink "${unvX.directory.module}/claude-code/agents/${agent}";
          target = ".config/claude/agents/${agent}";
        };
      })
      (builtins.attrNames (builtins.readDir ./agents)))
    // builtins.listToAttrs (
      map (skillFile: {
        name = "claude/skills/${skillFile}";
        value = {
          source = config.lib.file.mkOutOfStoreSymlink "${unvX.directory.module}/claude-code/skills/${skillFile}";
          target = ".config/claude/skills/${skillFile}";
        };
      })
      (builtins.concatLists (
        map (
          skillDir:
            map (file: "${skillDir}/${file}")
            (builtins.attrNames (builtins.readDir ./skills/${skillDir}))
        )
        (builtins.attrNames (builtins.readDir ./skills))
      ))
    );
}
