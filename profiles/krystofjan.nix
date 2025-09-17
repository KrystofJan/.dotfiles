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

  home.file = {
    ".gitconfig".source = ./../.gitconfig-work;
  };
}
