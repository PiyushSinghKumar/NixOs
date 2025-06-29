# /etc/nixos/modules/programs/packages.nix
{ pkgs, ... }:

{
  # System-wide packages, available to all users.
  environment.systemPackages = with pkgs; [
    adwaita-icon-theme
    btop
    git
    htop
    nixpkgs-fmt
    python3
    statix
    tmux
  ];
}