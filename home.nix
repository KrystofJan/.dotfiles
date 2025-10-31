{
  config,
  pkgs,
  lib,
  auggie,
  ...
}: let
  kanagawaTheme = pkgs.fetchFromGitHub {
    owner = "dangooddd";
    repo = "kanagawa.yazi";
    rev = "31167ed54c9cc935b2fa448d64d367b1e5a1105d"; # You can specify a specific commit/tag here
    sha256 = "sha256-phwGd1i/n0mZH/7Ukf1FXwVgYRbXQEWlNRPCrmR5uNk="; # Leave empty first, Nix will tell you the correct hash
  };

  onedarkTheme = pkgs.fetchFromGitHub {
    owner = "BennyOe";
    repo = "onedark.yazi";
    rev = "668d71d967857392012684c7dd111605cfa36d1a";
    sha256 = "sha256-tfkzVa+UdUVKF2DS1awEusfoJEjJh40Bx1cREPtewR0="; # Leave empty first, Nix will tell you the correct hash
  };
in {
  home.stateVersion = "24.11";

  # Enable auggie for all profiles
  programs.auggie.enable = true;

  home.packages = with pkgs; [
    act
    atuin
    btop
    cowsay
    delta
    dysk
    eza
    fd
    feh
    figlet
    fzf
    gemini-cli
    gh
    glab
    igrep
    jq
    lazydocker
    lazygit
    neofetch
    ripgrep
    starship
    vscode-json-languageserver
    watson
    xclip
    yazi
    zathura
    zellij
    zoxide

    nixd
    bash-language-server
  ];

  # Configure tmux through Home Manager with Nix-managed plugins
  programs.tmux = {
    enable = true;
    plugins = with pkgs.tmuxPlugins; [
      sensible
      yank
      vim-tmux-navigator
    ];
    # Source our custom configuration file
    extraConfig = ''
      source-file ~/.config/tmux/tmux.conf
    '';
  };

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
    initExtra = builtins.readFile ./.zshrc;
  };

  home.file = {
    "./.config/starship.toml".source = ./.config/starship.toml;
    ".config/nvim".source = ./.config/nvim;
    ".config/bat".source = ./.config/bat;
    ".config/zellij".source = ./.config/zellij;
    ".config/alacritty".source = ./.config/alacritty;
    ".config/kitty".source = ./.config/kitty;
    ".config/ghostty".source = ./.config/ghostty;
    ".config/lazygit".source = ./.config/lazygit;
    ".config/tmux".source = ./.config/tmux;
    ".gitconfig-base".source = ./.gitconfig-base;
    ".gitconfig-corellium".source = ./.gitconfig-corellium;
    "fzf-git.sh/fzf-git.sh".source = ./fzf-git.sh;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    HYPRCURSOR_THEME = "rose-pine-hyprcursor";
    HYPRCURSOR_SIZE = "24";
    XCURSOR_THEME = "rose-pine-hyprcursor";
    XCURSOR_SIZE = "24";
  };

  programs.bat = {
    enable = true;
    config = {
      theme = "Oldworld";
    };
  };

  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    theme = {
      flavor = {
        dark = "onedark";
        light = "onedark";
      };
    };
    settings = {
      mgr = {
        show_hidden = true;
        ratio = [1 3 4];
      };
      open = {
        run = ''
          if [[ "$1" =~ \.(png|jpg|jpeg|webp|gif)$ ]]; then
            open --block -- feh "$1"
          else
            open -- "$1"
          fi
        '';
        desc = "Open files, using feh for images";
      };
    };

    flavors = {
      kanagawa = kanagawaTheme;
      onedark = onedarkTheme;
    };
  };

  programs.home-manager.enable = true;
}
