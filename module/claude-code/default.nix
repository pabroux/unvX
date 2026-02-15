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
    // builtins.listToAttrs (map (command: {
        name = "claude/commands/${command}";
        value = {
          source = config.lib.file.mkOutOfStoreSymlink "${unvX.directory.module}/claude-code/commands/${command}";
          target = ".config/claude/commands/${command}";
        };
      })
      (builtins.attrNames (builtins.readDir ./commands)));
}
