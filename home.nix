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
    "fzf-git.sh/fzf-git.sh".source = ./fzf-git.sh;
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/krystofjan/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
