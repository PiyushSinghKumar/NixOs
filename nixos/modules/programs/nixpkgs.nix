# /etc/nixos/modules/programs/nixpkgs.nix
{ config, pkgs, ... }:

# Fetch the latest nixos-unstable channel as a package set.
let
  unstable-tarball = fetchTarball "https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz";
  unstable = import unstable-tarball { config = config.nixpkgs.config; };
in
{
  nixpkgs.config.allowUnfree = true;

  # Use an overlay to replace the stable 'ollama' with the one from unstable.
  nixpkgs.overlays = [ (final: prev: { ollama = unstable.ollama; }) ];
}