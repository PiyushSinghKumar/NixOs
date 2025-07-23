# Configures Nix and Nixpkgs settings (experimental features, allowUnfree, etc.).
{ ... }:

{
  # Enable flakes and the new nix command-line interface
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
}
