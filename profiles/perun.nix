{
  config,
  lib,
  pkgs,
  ...
}: let
  # Define treesitterWithGrammars
  treesitterWithGrammars = pkgs.vimPlugins.nvim-treesitter.withAllGrammars;

  # Create a symlink join for the Treesitter parsers
  treesitterParsers = pkgs.symlinkJoin {
    name = "treesitter-parsers";
    paths = treesitterWithGrammars.dependencies;
  };
in {
  home.username = "zahry";
  home.homeDirectory = "/home/zahry";

  home.packages = with pkgs; [
    tree-sitter
  ];

  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      lazy-nvim
      nvim-treesitter.withAllGrammars
    ];
  };

  # Append the Treesitter parsers path to init.lua
  home.file = {
    ".config/nvim/lua/zahry/init.lua".text = ''
      vim.opt.runtimepath:append("${treesitterParsers}")
      require'nvim-treesitter.configs'.setup {
        highlight = { enable = true },
        indent = { enable = true },
      }
    '';

    ".gitconfig".source = ./../.gitconfig-personal;
  };

  services.udiskie = {
    enable = true;
    automount = true;
    notify = true;
    tray = "auto";
    settings = {
      program_options = {
        file_manager = "${pkgs.nemo-with-extensions}/bin/nemo";
        udisks_version = 2;
      };
      mount_options = {
        "*" = [
          "noatime"
          "uid=1000"
          "gid=100"
          "umask=022"
        ];
      };
    };
  };

  # TODO: MANAGE HYPR
}
