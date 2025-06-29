# /etc/nixos/modules/users/home.nix
{ pkgs, ... }:

{
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  home-manager.users.voldy = {
    home.stateVersion = "25.05";

    # User-specific packages.
    home.packages = with pkgs; [
      brave
      discord
      kdePackages.kate
      lutris
      onlyoffice-desktopeditors
      vscode
      zed-editor
    ];

    programs.git = {
      enable = true;
      userName = "Piyush Kumar Singh";
      userEmail = "piyushkumarsingh.nmims@gmail.com";
    };
  };
}