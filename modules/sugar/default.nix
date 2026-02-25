{
  lib,
  config,
  pkgs,
  home,
  ...
}: let
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
    # Add zsh configuration for sugar tools
    zsh.initContent = lib.mkAfter (builtins.readFile ./sugar.zsh);

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
      shellWrapperName = "y";

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
          edit = [
            {
              run = ''nvim "$@"'';
              desc = "Edit in neovim";
              block = true;
            }
          ];
          feh = [
            {
              run = "feh --auto-zoom --scale-down \"$@\"";
              desc = "Open images with feh";
              orphan = true;
            }
          ];
          mpv = [
            {
              run = ''mpv --force-window "$@"'';
              desc = "Open videos";
              orphan = true;
            }
          ];
          open = [
            {
              run = ''xdg-open "$1"'';
              desc = "Open";
            }
          ];
          reveal = [
            {
              run = ''xdg-open "$(dirname "$1")"'';
              desc = "Reveal";
            }
          ];
          extract = [
            {
              run = ''ya pub extract --list "$@"'';
              desc = "Extract here";
            }
          ];
        };

        open = {
          rules = [
            # Folder
            {
              name = "*/";
              use = ["edit" "open" "reveal"];
            }
            # Text
            {
              mime = "text/*";
              use = ["edit" "reveal"];
            }
            # Media
            {
              mime = "application/{zip,rar,7z*,tar,gzip,xz,zstd,bzip*,lzma,compress,archive,cpio,arj,xar,ms-cab*}";
              use = ["extract" "reveal"];
            }
            # JSON
            {
              mime = "application/{json,ndjson}";
              use = ["edit" "reveal"];
            }
            {
              mime = "*/javascript";
              use = ["edit" "reveal"];
            }
            # Empty file
            {
              mime = "inode/empty";
              use = ["edit" "reveal"];
            }
            # Fallback
            {
              name = "*";
              use = ["open" "reveal"];
            }
            {
              mime = "image/*";
              use = ["feh"];
            }
            {
              mime = "video/*";
              use = ["mpv"];
            }
          ];
        };
      };

      flavors = {
        onedark = onedarkTheme;
      };
    };
  };
}
