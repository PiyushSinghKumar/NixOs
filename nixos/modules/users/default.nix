# /etc/nixos/modules/users/default.nix
#
# This module groups all user-related configurations, including
# system-level account definitions and user-specific Home Manager settings.

{
  imports = [ ./accounts.nix ./home.nix ];
}