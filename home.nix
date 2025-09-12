{
  config,
  pkgs,
  lib,
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

  home.packages = with pkgs; [
    act
    atuin
    bat
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
    igrep
    lazydocker
    lazygit
    neofetch
    ripgrep
    starship
    tmux
    vscode-json-languageserver
    watson
    xclip
    yazi
    zathura
    zellij
    zoxide
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
    "./.config/starship.toml".source = ./.config/starship.toml;
    ".config/nvim".source = ./.config/nvim;
    ".config/zellij".source = ./.config/zellij;
    ".config/alacritty".source = ./.config/alacritty;
    ".config/kitty".source = ./.config/kitty;
    ".config/ghostty".source = ./.config/ghostty;
    ".config/lazygit".source = ./.config/lazygit;
    ".gitconfig-base".source = ./.gitconfig-base;
    ".gitconfig-corellium".source = ./.gitconfig-corellium;
    "fzf-git.sh/fzf-git.sh".source = ./fzf-git.sh;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
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
