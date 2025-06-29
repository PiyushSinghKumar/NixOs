# /etc/nixos/modules/drivers/nvidia.nix
{ config, ... }:

{
  # NVIDIA driver configuration.
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    powerManagement.finegrained = true;
    open = false; # Use the proprietary driver.
    nvidiaSettings = true;

    # Configure PRIME render offload.
    prime = {
      offload.enable = true;
      amdgpuBusId = "PCI:7:0:0";
      nvidiaBusId = "PCI:1:0:0";
    };

    # Use the stable NVIDIA driver package.
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}
