{ config, lib, pkgs, ... }:

let
  # Define treesitterWithGrammars
  treesitterWithGrammars = pkgs.vimPlugins.nvim-treesitter.withAllGrammars;

  # Create a symlink join for the Treesitter parsers
  treesitterParsers = pkgs.symlinkJoin {
    name = "treesitter-parsers";
    paths = treesitterWithGrammars.dependencies;
  };
in
{
  home.username = "zahry";
  home.homeDirectory = "/home/zahry";

  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      lazy-nvim
      nvim-treesitter.withAllGrammars
    ];
  };

  # Append the Treesitter parsers path to init.lua
  home.file.".config/nvim/lua/zahry/init.lua".text = ''
    vim.opt.runtimepath:append("${treesitterParsers}")
  '';

  # TODO: MANAGE HYPR
}

