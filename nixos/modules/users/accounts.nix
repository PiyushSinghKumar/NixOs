# /etc/nixos/modules/users/accounts.nix
{ ... }:

{
  users.users.voldy = {
    isNormalUser = true;
    description = "Piyush Singh";
    extraGroups = [ "networkmanager" "wheel" ];
  };
}
