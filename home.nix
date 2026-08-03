{...}: {
  home.stateVersion = "24.11";

  home.file = {
    ".config/nvim".source = ./.config/nvim;
    ".gitconfig".source = ./.gitconfig;
    ".gitconfig-base".source = ./.gitconfig-base;
    ".gitconfig-profiq".source = ./.gitconfig-profiq;
    ".gitconfig-personal".source = ./.gitconfig-personal;
    ".gitconfig-corellium".source = ./.gitconfig-corellium;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    HYPRCURSOR_THEME = "rose-pine-hyprcursor";
    HYPRCURSOR_SIZE = "24";
    XCURSOR_THEME = "rose-pine-hyprcursor";
    XCURSOR_SIZE = "24";
  };

  programs.home-manager.enable = true;
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
