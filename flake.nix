{
  description = "unvX: a simple Home Manager configuration";

  inputs = {
    # nixpkgs, home-manager, flake-utils not required since they are available
    # in the global flake registry
  };

  outputs = {
    nixpkgs,
    home-manager,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachSystem flake-utils.lib.allSystems (system: {
      # Specify all your configurations
      # By default, Home Manager will match first `$USER@$(hostname)` then `$USER`
      packages.homeConfigurations = {
        "sulfyderz@Sulfyderz-MacBook-Pro.local" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${system};

          # Specify your Home Manager entry point
          modules = [./host/Sulfyderz-MacBook-Pro/user/sulfyderz/home.nix];

          # Optionally use extraSpecialArgs to pass through arguments
          # to your entry point
        };
      };
    });
}
