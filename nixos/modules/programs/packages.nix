# /etc/nixos/modules/programs/packages.nix
{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    adwaita-icon-theme
    brave
    btop
    discord
    git
    htop
    kdePackages.kate
    lutris
    # mangohud
    nixpkgs-fmt
    onlyoffice-desktopeditors
    python3
    statix
    vscode
    zed-editor
    tmux
  ];
}