# /etc/nixos/modules/drivers/default.nix
{ ... }:

{
  imports = [
    ./amd.nix
    ./nvidia.nix
  ];

  # Enable OpenGL and 32-bit support.
  hardware.graphics.enable = true;
  hardware.graphics.enable32Bit = true;

  # Configure X.Org Server to use both drivers for the hybrid setup.
  services.xserver.videoDrivers = [ "amdgpu" "nvidia" ];
}