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
  };

  outputs = {
    nixpkgs,
    home-manager,
    alejandra,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    packages.${system}.default = [
      pkgs.neovim
    ];
    homeConfigurations."krystofjan" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [./home.nix ./profiles/krystofjan.nix];
    };

    homeConfigurations."zahry" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [./home.nix ./profiles/zahry.nix];
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
