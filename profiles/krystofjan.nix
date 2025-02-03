
{ config, lib, ... }:
{
      home.username = "krystofjan";
      home.homeDirectory = "/home/krystofjan";
      


  home.packages = with pkgs; [
    neovim
  ];
}

