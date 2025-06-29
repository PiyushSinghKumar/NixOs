# /etc/nixos/modules/users/default.nix
{ config, pkgs, ... }:

{
  users.users.voldy = {
    isNormalUser = true;
    description = "Piyush Singh";
    extraGroups = [ "networkmanager" "wheel" ];
  };
}