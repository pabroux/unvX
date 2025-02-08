{
  description = "unvX: a simple Home Manager configuration";

  inputs = {
    # nixpkgs, home-manager and flake-utils are by default loaded since they are
    # available in the global flake registry.
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    nixpkgs,
    home-manager,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachSystem flake-utils.lib.allSystems (system: {
      # Specify all your configurations. Home Manager will by default match first
      # `$USER@$(hostname)`. If not found, it will then default to `$USER`.
      packages.homeConfigurations = {
        "sulfyderz@Sulfyderz-MacBook-Pro.local" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${system};

          # Specify your Home Manager entry point.
          modules = [./host/Sulfyderz-MacBook-Pro/user/sulfyderz/home.nix];

          # Optionally use extraSpecialArgs to pass through arguments
          # to your entry point.
        };
      };
    });
}
