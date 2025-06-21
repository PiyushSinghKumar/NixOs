# modules/programs.nix
{ config, pkgs, ... }:

{
  # Allow unfree packages, necessary for many proprietary applications
  nixpkgs.config.allowUnfree = true;

  # System-wide packages you want installed
  environment.systemPackages = with pkgs; [
    adwaita-icon-theme
    vscode
    python3
    brave
    discord
    lutris
    kdePackages.kate
    btop
    htop
    mangohud
    onlyoffice-desktopeditors
  ];

  # Enable Firefox with its specific NixOS module
  programs.firefox.enable = true;
  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;

  programs.gamemode.enable = true;

  environment.variables = {
    MANGOHUD = "1";
    MANGOHUD_DLSYM = "1";
  };
}
