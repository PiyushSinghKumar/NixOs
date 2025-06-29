# /etc/nixos/modules/users/accounts.nix
{ config, pkgs, ... }:

{
  users.users.voldy = {
    isNormalUser = true;
    description = "Piyush Singh";
    extraGroups = [ "networkmanager" "wheel" ];
  };
}
