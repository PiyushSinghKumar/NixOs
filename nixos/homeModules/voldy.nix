{ config, pkgs, ... }:

{
  home.username = "voldy";
  home.homeDirectory = "/home/voldy";
  home.stateVersion = "25.05";

  programs.home-manager.enable = true;

  programs.bash = {
    enable = true;
    shellAliases = {
      nrs = "sudo nixos-rebuild switch && sudo nix-collect-garbage -d";
    };
  };

  home.packages = with pkgs; [
    brave
    lutris
    unzip
    vscode
    wineWowPackages.stable
    dxvk
    vkd3d
    steam
  ];

  programs.git.enable = true;

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      clock-show-date = true;
      enable-animations = true;
    };
  };
}
