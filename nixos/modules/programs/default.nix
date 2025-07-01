# /etc/nixos/modules/programs/default.nix
#
# This file acts as an entry point for all program-related configurations.

{
  imports = [
    ./packages.nix
    ./services.nix
  ];
}
