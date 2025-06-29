# configuration.nix
{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./modules/drivers
      ./modules/system
      ./modules/desktop
      ./modules/users
      ./modules/programs
    ];
}
