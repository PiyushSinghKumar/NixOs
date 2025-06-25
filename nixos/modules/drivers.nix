# modules/drivers.nix
{ config, pkgs, lib, ... }: # Ensure 'lib' is included here

{
  # Ensure OpenGL support is explicitly enabled and 32-bit for compatibility
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true; # Crucial for 32-bit games/apps (e.g., Wine/Proton)
    };

    # NVIDIA specific configuration for PRIME render offload
    nvidia = {
      modesetting.enable = true; # Essential for modern NVIDIA drivers and PRIME
      powerManagement.enable = true; # Enable power management for NVIDIA dGPU
      powerManagement.finegrained = true; # RTX 3050 Ti is Turing/Ampere based, so finegrained is beneficial
      open = false; # Use proprietary NVIDIA drivers
      nvidiaSettings = true; # Enable the NVIDIA X Server Settings utility

      # PRIME render offload configuration
      prime = {
        offload.enable = true; # Enable PRIME render offload
        amdgpuBusId = "PCI:7:0:0"; # <--- AMD iGPU (Cezanne)
        nvidiaBusId = "PCI:1:0:0"; # <--- NVIDIA dGPU (RTX 3050 Ti)
      };

      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
  };
  # Load the AMDGPU kernel module early for the integrated GPU
  boot.initrd.kernelModules = [ "amdgpu" ];

  # Configure Xorg to use both drivers.
  # The *first* driver listed here is typically the one that drives the primary display.
  # For PRIME render offload, you generally want your iGPU (amdgpu) to be primary.
  services.xserver.videoDrivers = [ "amdgpu" "nvidia" ];

  # NOTE: Vulkan and VA-API (for hardware video acceleration) are automatically
  # configured for both AMD and NVIDIA by the options enabled above.
  # `hardware.graphics.enable` handles Mesa/AMD drivers, and `hardware.nvidia`
  # handles the proprietary NVIDIA components.
}
