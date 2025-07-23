# Entry point for all user-facing program and package configuration.
# /etc/nixos/modules/programs/default.nix
{
  imports = [
    ./packages.nix
    ./services.nix
  ];
}
