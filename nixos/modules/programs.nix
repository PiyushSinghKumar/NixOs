# modules/programs.nix
{ config, pkgs, ... }:

{
  # Allow unfree packages, necessary for many proprietary applications
  nixpkgs.config.allowUnfree = true;

  # System-wide packages you want installed
  environment.systemPackages = with pkgs; [
    adwaita-icon-theme
    brave
    btop
    discord
    git
    htop
    kdePackages.kate
    lutris
    mangohud
    nixpkgs-fmt
    onlyoffice-desktopeditors
    python3
    statix
    vscode
  ];

  # Enable programs with their specific NixOS modules
  programs = {
    firefox.enable = true;
    steam = {
      enable = true;
      gamescopeSession.enable = true;
    };
    gamemode.enable = true;
  };

  environment.variables = {
    MANGOHUD = "1";
    MANGOHUD_DLSYM = "1";
  };
}
