{
  description = "Home Manager configuration of krystofjan";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    alejandra.url = "github:kamadorueda/alejandra/3.1.0";
    alejandra.inputs.nixpkgs.follows = "nixpkgs";
    auggie.url = "github:KrystofJan/auggie-nix-flake";
  };

  outputs = {
    nixpkgs,
    home-manager,
    alejandra,
    auggie,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    packages.${system}.default = pkgs.neovim;

    homeConfigurations."krystofjan" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      extraSpecialArgs = { inherit auggie; };

      modules = [
        ./home.nix
        ./profiles/krystofjan.nix
        auggie.homeManagerModules.default
      ];
    };

    homeConfigurations."veles" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      extraSpecialArgs = { inherit auggie; };

      modules = [
        ./home.nix
        ./profiles/zahry.nix
        auggie.homeManagerModules.default
      ];
    };

    homeConfigurations."perun" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      extraSpecialArgs = { inherit auggie; };

      modules = [
        ./home.nix
        ./profiles/perun.nix
        auggie.homeManagerModules.default
      ];
    };

    devShell.${system} = pkgs.mkShell {
      packages = [
        pkgs.nixd
        alejandra.defaultPackage.${system}
        pkgs.lua-language-server
      ];
    };
  };
}
