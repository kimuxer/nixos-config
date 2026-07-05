# -- modules/desktop/packages.nix --
{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    evtest
    udiskie
    btrfs-assistant
    adw-gtk3
    papirus-icon-theme
    bibata-cursors
  ];
}
