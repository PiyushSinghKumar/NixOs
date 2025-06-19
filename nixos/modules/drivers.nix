# modules/drivers.nix
{ config, pkgs, lib, ... }: # Ensure 'lib' is included here

{
  # Ensure OpenGL support is explicitly enabled and 32-bit for compatibility
  hardware.graphics.enable = true;
  hardware.graphics.enable32Bit = true; # Crucial for 32-bit games/apps (e.g., Wine/Proton)

  # Load the AMDGPU kernel module early for the integrated GPU
  boot.initrd.kernelModules = [ "amdgpu" ];

  # Configure Xorg to use both drivers.
  # The *first* driver listed here is typically the one that drives the primary display.
  # For PRIME render offload, you generally want your iGPU (amdgpu) to be primary.
  services.xserver.videoDrivers = [ "amdgpu" "nvidia" ];

  # NVIDIA specific configuration for PRIME render offload
  hardware.nvidia = {
    modesetting.enable = true; # Essential for modern NVIDIA drivers and PRIME
    powerManagement.enable = true; # Enable power management for NVIDIA dGPU
    powerManagement.finegrained = true; # RTX 3050 Ti is Turing/Ampere based, so finegrained is beneficial
    open = false; # Use proprietary NVIDIA drivers
    nvidiaSettings = true; # Enable the NVIDIA X Server Settings utility

    # PRIME render offload configuration
    prime = {
      offload.enable = true;          # Enable PRIME render offload
      # enableOffloadCmd = true;      # REMOVED/COMMENTED OUT in previous step

      # --- YOUR ACTUAL GPU BUS IDs ---
      amdgpuBusId = "PCI:7:0:0"; # <--- AMD iGPU (Cezanne)
      nvidiaBusId = "PCI:1:0:0"; # <--- NVIDIA dGPU (RTX 3050 Ti)
    };

    # Optional: If you need a specific NVIDIA driver version (e.g., 550)
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  # Optional: For better AMD Vulkan and VAAPI (hardware video acceleration)
  # THE ENTIRE BLOCK BELOW IS BEING REMOVED/COMMENTED OUT
  # hardware.video.mesa.enable = true;
  # hardware.video.mesa.drivers = [ "amdgpu" ];
  # hardware.video.enableUnifiedMemory = true; # REMOVED/COMMENTED OUT in previous step
}