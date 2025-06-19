# modules/programs.nix
{ config, pkgs, ... }:

{
  # Allow unfree packages, necessary for many proprietary applications
  nixpkgs.config.allowUnfree = true;

  # System-wide packages you want installed
  environment.systemPackages = with pkgs; [
    # gnome-tweaks
    # adwaita-icon-theme
    # Development
    vscode # Microsoft Visual Studio Code
    python3 # Python 3 environment
    brave

    # Communication
    discord # Discord chat client

    # Gaming
    # lutris # Lutris game manager

    # Existing user-specific packages (moved here for simplicity)
    kdePackages.kate # KDE text editor
    btop
    htop
  ];

  # Enable Firefox with its specific NixOS module
  programs.firefox.enable = true;
  # programs.steam.enable = true;
}
