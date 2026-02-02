{pkgs, ...}: let
  # Define treesitterWithGrammars
  treesitterWithGrammars = pkgs.vimPlugins.nvim-treesitter.withAllGrammars;

  # Create a symlink join for the Treesitter parsers
  treesitterParsers = pkgs.symlinkJoin {
    name = "treesitter-parsers";
    paths = treesitterWithGrammars.dependencies;
  };
in {
  imports = [
    ../modules/zsh/default.nix
    ../modules/tmux/default.nix
    ../modules/sugar/default.nix
    ../modules/desktop/default.nix
    ../modules/essentials/default.nix
    ../modules/development/default.nix
  ];

  zsh.enable = true;
  tmux.enable = true;
  sugar.enable = false;
  desktop.enable = false;
  essentials.enable = true;
  development.enable = true;

  home.username = "bielobog";
  home.homeDirectory = "/home/bielobog";

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
}
