{
  lib,
  config,
  pkgs,
  home,
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
  options.sugar = {
    enable = lib.mkEnableOption "Enable cli sugar";
  };

  config = lib.mkIf config.sugar.enable {
    home.packages = with pkgs; [
      atuin
      btop
      delta
      dysk
      igrep
      zoxide
      eza
      yazi
      ripgrep
      starship

      neofetch
      cowsay
      figlet

      zathura
    ];

    home.file = {
      "./.config/starship.toml".source = ../../.config/starship.toml;
      ".config/bat".source = ../../.config/bat;
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

        preview = {
          max_width = 600;
          max_height = 600;
        };

        opener = {
          feh = [
            {
              run = "feh --auto-zoom --scale-down \"$@\"";
              desc = "Open images with feh";
              orphan = true;
            }
          ];
        };

        open = {
          rules = [
            {
              mime = "image/*";
              use = ["feh"];
            }
          ];
        };
      };

      flavors = {
        kanagawa = kanagawaTheme;
        onedark = onedarkTheme;
      };
    };
  };
}
