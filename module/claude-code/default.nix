{
  config,
  pkgs,
  lib,
  unvX,
  ...
}: let
  agents = [
    "DocsExplorer"
  ];
in {
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
        name = "claude/agents/${agent}.md";
        value =
          (agent: {
            source = config.lib.file.mkOutOfStoreSymlink "${unvX.directory.module}/claude-code/agents/${agent}.md";
            target = ".config/claude/agents/${agent}.md";
          })
          agent;
      })
      agents);
}
