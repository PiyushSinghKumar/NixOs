# Configures the Immich service (photo and video backup server).
{
  services.immich = {
    enable = true;
    port = 2283;
    host = "0.0.0.0";
    mediaLocation = "/var/lib/immich";
    openFirewall = true;
  };
}
