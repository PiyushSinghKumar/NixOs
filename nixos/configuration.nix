# configuration.nix
{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./modules/drivers.nix
      ./modules/programs.nix
    ];

  # Bootloader.
  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    kernelParams = [ "quiet" ];
  };

  networking.hostName = "nixos";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
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

  services = {
    # Enable X server if you're not exclusively using Wayland
    xserver = {
      enable = true;
      # Configure keymap in X11
      xkb = {
        layout = "de";
        variant = "";
      };
    };

    # Enable the Plasma 6 Desktop Environment.
    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;

    # Enable CUPS for printing
    printing.enable = true;

    # Enable sound with PipeWire
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # jack.enable = true; # Uncomment if you need JACK applications
    };
    pulseaudio.enable = false; # Disable PulseAudio if using PipeWire

    # Enable thermald for better thermal management on laptops, especially with AMD CPUs.
    thermald.enable = true;
  };

  # Configure console keymap
  console.keyMap = "de";

  security.rtkit.enable = true;

  # Enable Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  # User account definition
  # Note: The packages previously listed here are now in programs.nix
  users.users.voldy = {
    isNormalUser = true;
    description = "Piyush Singh";
    extraGroups = [ "networkmanager" "wheel" ];
    # packages are now handled in modules/programs.nix or via home-manager
  };

  # System state version
  system.stateVersion = "25.05"; # Keep this consistent with your NixOS version
}
