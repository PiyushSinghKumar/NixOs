# Configures user-facing programs (not system services).
{ ... }:

{
  programs = {
    firefox.enable = false;
    steam = {
      enable = false;
      gamescopeSession.enable = false;
    };
    gamemode.enable = false;
  };

  # environment.variables = {
  #   MANGOHUD = "1";
  #   MANGOHUD_DLSYM = "1";
  # };
}
