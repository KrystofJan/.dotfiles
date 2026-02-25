{
  lib,
  config,
  pkgs,
  home,
  ...
}: let
  cfg = config.vibe;
in {
  options.vibe = {
    enable = lib.mkEnableOption "Enable vibe coding";

    auggie = {
      enable = lib.mkEnableOption "Enable auggie";
    };

    opencode = {
      enable = lib.mkEnableOption "Enable opencode";
    };

    claude = {
      enable = lib.mkEnableOption "Enable claude code";
    };
  };

  config = lib.mkIf cfg.enable (lib.mkMerge [
    (lib.mkIf cfg.auggie.enable {
      programs.auggie.enable = true;
    })

    (lib.mkIf (cfg.opencode.enable || cfg.claude.enable) {
      zsh.initContent = lib.mkAfter (builtins.readFile ./vibe.zsh);
    })

    (lib.mkIf cfg.claude.enable {
      nixpkgs.config.allowUnfreePredicate = pkg:
        builtins.elem (lib.getName pkg) [
          "claude-code"
        ];
      home.packages = with pkgs; [
        claude-code
        awscli2
      ];
    })

    (lib.mkIf cfg.opencode.enable {
      home.packages = with pkgs; [
        # TODO: rn I'm using the one from aur
        # opencode
        awscli2
      ];
    })
  ]);
}
