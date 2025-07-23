# configuration.nix
{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./modules/hardware
      ./modules/services
      ./modules/system
      ./modules/desktop
      ./modules/users
      ./modules/programs
    ];
}
