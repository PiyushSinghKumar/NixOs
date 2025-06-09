{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Berlin";

  i18n.defaultLocale = "en_GB.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.xserver.xkb.layout = "de";
  console.keyMap = "de";
  services.xserver.videoDrivers = [ "nvidia" "amdgpu" ];

  services.printing.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    open = false;
    nvidiaSettings = true;
  };

  hardware.graphics.enable = true;

  users.users.voldy = {
    isNormalUser = true;
    description = "Piyush Singh";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # Configure Home Manager to use the system's Nixpkgs instance.
  # This ensures it inherits settings like `allowUnfree = true;`.
  home-manager.useGlobalPkgs = true;

  # Note: Your Home Manager configuration for the user 'voldy'
  # (e.g., home-manager.users.voldy = { ... };), where vscode is likely listed
  # in home.packages, might be in this file or imported from another file.

  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    git
    pciutils
    tree
    python312
    python312Packages.pip
  ];

  system.stateVersion = "25.05";
}
