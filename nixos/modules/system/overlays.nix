# /etc/nixos/modules/system/overlays.nix
# This module defines an overlay to add packages from nixpkgs-unstable.
{ inputs, ... }:

{
  nixpkgs.overlays = [
    (final: prev:
      let
        unstable-pkgs = import inputs.nixpkgs-unstable {
          system = prev.system;
          config.allowUnfree = true;
        };
      in
      {
        unstable = unstable-pkgs;
        ollama = unstable-pkgs.ollama;

        kdePackages = unstable-pkgs.kdePackages;
        sddm = unstable-pkgs.sddm;
      })
  ];
}