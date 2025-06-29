# /etc/nixos/modules/programs/services.nix
{ ... }:

{
  programs = {
    firefox.enable = true;
    steam = {
      enable = true;
      gamescopeSession.enable = true;
    };
    gamemode.enable = true;
  };

  services.ollama.enable = true;

  # environment.variables = {
  #   MANGOHUD = "1";
  #   MANGOHUD_DLSYM = "1";
  # };
}
