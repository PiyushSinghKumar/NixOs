# Configures user account definitions.
{ ... }:

{
  users.users.voldy = {
    isNormalUser = true;
    description = "Piyush Singh";
    extraGroups = [ "networkmanager" "wheel" ];
  };
}
