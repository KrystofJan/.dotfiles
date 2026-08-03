{
  config,
  lib,
  pkgs,
  continue-cli, # Add this
  system ? "x86_64-linux", # Add this with default
  ...
}: {
  imports = [
    ../modules/zsh/default.nix
    ../modules/tmux/default.nix
    ../modules/sugar/default.nix
    ../modules/desktop/default.nix
    ../modules/essentials/default.nix
    ../modules/development/default.nix
    ../modules/vibe/default.nix
  ];

  vibe = {
    enable = true;
    auggie.enable = true;
    opencode.enable = true;
    claude.enable = true;
  };
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
    continue-cli.packages.${system}.default
    awscli2
    google-cloud-sdk
  ];

  home.file = {
    ".config/tmux".source = ./../.config/tmux;
  };
}
