# /etc/nixos/modules/users/home.nix
{ pkgs, ... }:

{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.voldy = {
      home.stateVersion = "25.05";

      # User-specific packages.
      home.packages = with pkgs; [
        brave
        discord
        kdePackages.kate
        lutris
        onlyoffice-desktopeditors
        vscode
        unstable.zed-editor # Pulled from nixpkgs-unstable via our overlay
      ];

      programs.git = {
        enable = true;
        userName = "Piyush Kumar Singh";
        userEmail = "piyushkumarsingh.nmims@gmail.com";
      };
    };
  };
}
