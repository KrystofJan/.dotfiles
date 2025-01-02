{ config, pkgs, lib, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should manage. targets.genericLinux.enable = true;
  home.username = "krystofjan";
  home.homeDirectory = "/home/krystofjan";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager

  home.stateVersion = "24.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    neovim	

    zellij
    fzf
    fd
    thefuck
    zoxide
    atuin
    eza
    bat
    btop
    neofetch
    yazi
    act        
    cowsay
    lazygit
    starship
        
    xclip
  ];

  programs.zsh = {
      enable = true;
  };


  # home.activation.addShellToEtcShells = lib.mkAfter ''
  #   if ! grep -qx "${pkgs.zsh}/bin/zsh" /etc/shells; then
  #     echo "Adding ${pkgs.zsh}/bin/zsh to /etc/shells"
  #     echo ${pkgs.zsh}/bin/zsh | sudo tee -a /etc/shells
  #   fi
  # '';
  #
  # home.activation.setShell = lib.mkAfter ''
  #   if [ "$(getent passwd $USER | cut -d: -f7)" != "${pkgs.zsh}/bin/zsh" ]; then
  #     echo "Changing default shell to Zsh for user $USER"
  #     chsh -s ${pkgs.zsh}/bin/zsh
  #   fi
  # '';

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;
    ".zshrc".source = ./.zshrc;
    ".config/nvim".source = ./.config/nvim;
    ".config/zellij".source = ./.config/zellij;
    ".config/alacritty".source = ./.config/alacritty;
    ".config/kitty".source = ./.config/kitty;
    ".config/ghostty".source = ./.config/ghostty;
    ".config/yazi".source = ./.config/yazi;
    ".config/lazygit".source = ./.config/lazygit;
    "fzf-git.sh/fzf-git.sh".source = ./fzf-git.sh;
    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/krystofjan/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
