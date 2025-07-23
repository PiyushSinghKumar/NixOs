# Configures Home Manager user settings for 'voldy'.
{ pkgs, ... }:

{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.voldy = {
      home.stateVersion = "25.05";

      # User-specific packages.
      home.packages = with pkgs.unstable; [
        brave
        code-cursor
        libreoffice-qt6-fresh
        vscode
        zed-editor
      ];

      programs.git = {
        enable = true;
        userName = "Piyush Kumar Singh";
        userEmail = "piyushkumarsingh.nmims@gmail.com";
      };
    };
  };
}
