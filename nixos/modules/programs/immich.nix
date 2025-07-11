{
  networking.firewall.allowedTCPPorts = [ 2283 ];
  services.immich = {
    enable = true;
    port = 2283;
    mediaLocation = "/var/lib/immich";
    host = "0.0.0.0";
  };
}