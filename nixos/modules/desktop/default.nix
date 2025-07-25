# Configures the desktop environment, display manager, printing, and audio settings.
# /etc/nixos/modules/desktop/default.nix
{ pkgs, ... }:

{
  services = {
    xserver = {
      enable = true;
      xkb = {
        layout = "de";
        variant = "";
      };
    };

    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;
    printing.enable = true;

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
  };

  security.rtkit.enable = true;

  # Exclude default applications from the Plasma desktop environment.
  environment.plasma6.excludePackages = with pkgs; [
    kdePackages.kate
  ];
}
