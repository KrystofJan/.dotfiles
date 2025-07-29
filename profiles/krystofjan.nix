{
  config,
  lib,
  pkgs,
  ...
}: {
  home.username = "krystofjan";
  home.homeDirectory = "/home/krystofjan";
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "spotify"
    ];

  home.packages = with pkgs; [
    neovim
    spotify
  ];

  home.file = {
    ".gitconfig".source = ./../.gitconfig-work;
  };
}
