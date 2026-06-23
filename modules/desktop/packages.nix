# -- modules/desktop/packages.nix --
{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    evtest
    udiskie
    btrfs-assistant
    snapper
    adw-gtk3
    papirus-icon-theme
    bibata-cursors
  ];
}
