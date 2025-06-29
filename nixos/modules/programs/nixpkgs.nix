# /etc/nixos/modules/programs/nixpkgs.nix
{ inputs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  # Use an overlay to get ollama from the unstable channel defined in the flake.
  nixpkgs.overlays = [
    (final: prev: {
      inherit (inputs.nixpkgs-unstable.legacyPackages.${prev.system}) ollama;
    })
  ];
}
