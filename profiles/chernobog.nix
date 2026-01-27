{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
        ../modules/zsh/default.nix
        ../modules/tmux/default.nix
        ../modules/sugar/default.nix
        ../modules/desktop/default.nix
        ../modules/essentials/default.nix
        ../modules/development/default.nix
  ];

  programs.auggie.enable = true;
  zsh.enable = true;
  tmux.enable = true;
  sugar.enable = true;
  desktop.enable = true;
  essentials.enable = true;
  development.enable = true;

  home.username = "krystofjan";
  home.homeDirectory = "/home/krystofjan";

  home.packages = with pkgs; [
    neovim
  ];

  home.file = {
    ".gitconfig".source = ./../.gitconfig-work;
    ".config/tmux".source = ./../.config/tmux;
  };
}
