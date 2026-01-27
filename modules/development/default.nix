{
  lib,
  config,
  pkgs,
  home,
  ...
}: {
  options.development = {
    enable = lib.mkEnableOption "Enable devsugar";
  };

  config = lib.mkIf config.development.enable {
    home.packages = with pkgs; [
      act
      fd
      fzf
      gh
      glab
      lazydocker
      lazygit

      bc
      jq
    ];

    home.file = {
      "fzf-git.sh/fzf-git.sh".source = ../../fzf-git.sh;
      ".config/lazygit".source = ../../.config/lazygit;
    };
  };
}
