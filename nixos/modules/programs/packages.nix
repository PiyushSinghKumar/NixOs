# Configures system-wide user-facing packages.
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
    tmux
  ];
}
