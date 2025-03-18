{
  config,
  pkgs,
  lib,
  ...
}: {
  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    zellij
    fzf
    fd
    thefuck
    zoxide
    atuin
    eza
    bat
    btop
    neofetch
    yazi
    act
    cowsay
    lazygit
    delta
    starship
    ripgrep
    xclip
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    plugins = [
      {
        name = "zsh-nix-shell";
        file = "nix-shell.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "chisui";
          repo = "zsh-nix-shell";
          rev = "v0.8.0";
          sha256 = "1lzrn0n4fxfcgg65v0qhnj7wnybybqzs4adz7xsrkgmcsr0ii8b7";
        };
      }
    ];
  };

  home.file = {
    ".zshrc".source = ./.zshrc;
    ".config/nvim".source = ./.config/nvim;
    ".config/zellij".source = ./.config/zellij;
    ".config/alacritty".source = ./.config/alacritty;
    ".config/kitty".source = ./.config/kitty;
    ".config/ghostty".source = ./.config/ghostty;
    ".config/yazi".source = ./.config/yazi;
    ".config/lazygit".source = ./.config/lazygit;
    ".gitconfig".source = ./.gitconfig;
    ".gitconfig-profiq".source = ./.gitconfig-profiq;
    ".gitconfig-corellium".source = ./.gitconfig-corellium;
    "fzf-git.sh/fzf-git.sh".source = ./fzf-git.sh;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
