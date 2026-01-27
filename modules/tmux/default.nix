{
  lib,
  config,
  pkgs,
  home,
  ...
}: {
  options.tmux = {
    enable = lib.mkEnableOption "Enable tmux";
  };

  config = lib.mkIf config.tmux.enable {
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
  };
}
