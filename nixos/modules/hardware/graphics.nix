# Configures all graphics and GPU-related settings, including AMD/NVIDIA drivers, OpenGL, and hybrid graphics.
{ config, ... }:

{
  hardware = {
    nvidia = {
      modesetting.enable = true;
      powerManagement.enable = true;
      powerManagement.finegrained = true;
      open = false; # Use the proprietary driver.
      nvidiaSettings = true;
      prime = {
        offload.enable = true;
        amdgpuBusId = "PCI:7:0:0";
        nvidiaBusId = "PCI:1:0:0";
      };
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };

  # AMD GPU early boot
  boot.initrd.kernelModules = [ "amdgpu" ];

  # Configure X.Org Server to use both drivers for the hybrid setup
  services.xserver.videoDrivers = [ "amdgpu" "nvidia" ];
}
