{
  config,
  lib,
  pkgs,
  ...
}: {
  home.username = "krystofjan";
  home.homeDirectory = "/home/krystofjan";
  home.packages = with pkgs; [
    neovim
  ];
}
