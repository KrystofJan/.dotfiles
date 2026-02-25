{
  description = "Home Manager configuration of krystofjan";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    auggie.url = "github:KrystofJan/auggie-nix-flake";

    continue-cli = {
      url = "github:KrystofJan/continue-cli-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    auggie,
    continue-cli,
    home-manager,
    nixpkgs,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    packages.${system}.default = pkgs.neovim;

    homeConfigurations."chernobog" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      extraSpecialArgs = {inherit auggie continue-cli system;};
      modules = [
        ./home.nix
        ./profiles/chernobog.nix
        auggie.homeManagerModules.default
      ];
    };

    homeConfigurations."veles" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      extraSpecialArgs = {inherit auggie;};

      modules = [
        ./home.nix
        ./profiles/veles.nix
        auggie.homeManagerModules.default
      ];
    };

    homeConfigurations."perun" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      extraSpecialArgs = {inherit auggie;};

      modules = [
        ./home.nix
        ./profiles/perun.nix
        auggie.homeManagerModules.default
      ];
    };

    homeConfigurations."radegast" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      modules = [
        ./home.nix
        ./profiles/radegast.nix
      ];
    };
  };
}
