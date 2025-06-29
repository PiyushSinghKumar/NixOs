# /etc/nixos/modules/drivers/amd.nix
{ ... }:

{
  # Load amdgpu module in early boot for the integrated GPU.
  boot.initrd.kernelModules = [ "amdgpu" ];
}