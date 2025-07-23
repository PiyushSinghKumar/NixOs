# Entry point for all system service modules (e.g., Ollama, Immich).
# /etc/nixos/modules/services/default.nix
{ ... }:

{
  imports = [
    ./ollama.nix
    ./immich.nix
  ];
}
