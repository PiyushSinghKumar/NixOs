# Configures swap space using a swap file on the SSD.
{ config, ... }:

{
  swapDevices = [
    { device = "/swapfile"; size = 16 * 1024; } # 16GB swap file
  ];
}
