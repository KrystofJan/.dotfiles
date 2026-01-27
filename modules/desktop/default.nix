{
  lib,
  config,
  pkgs,
  home,
  ...
}: {
  options.desktop = {
    enable = lib.mkEnableOption "Enable desktop";
  };

  config = lib.mkIf config.desktop.enable {
    home.packages = with pkgs; [
      xclip
      rofi
      feh
    ];

    home.file = {
      ".config/alacritty".source = ../../.config/alacritty;
      ".config/kitty".source = ../../.config/kitty;
      ".config/ghostty".source = ../../.config/ghostty;
      ".config/rofi".source = ../../.config/rofi;
    };
  };
}
