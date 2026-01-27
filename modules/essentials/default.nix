{
  lib,
  config,
  pkgs,
  home,
  ...
}: {
  options.essentials = {
    enable = lib.mkEnableOption "Enable essentials";
  };

  config = lib.mkIf config.essentials.enable {
    home.packages = with pkgs; [
      nixd
      alejandra
      bash-language-server
      vscode-json-languageserver
    ];
  };
}
