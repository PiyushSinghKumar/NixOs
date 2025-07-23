# Entry point for all hardware-related configuration modules (graphics, bluetooth, thermald, etc.)
# /etc/nixos/modules/hardware/default.nix
{ ... }:

{
  imports = [
    ./graphics.nix
    ./bluetooth.nix
    ./thermald.nix
    ./swap.nix
  ];
}
