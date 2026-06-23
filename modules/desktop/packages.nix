# -- modules/desktop/packages.nix --
{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    udiskie
    btrfs-assistant
    snapper
    adw-gtk3
    papirus-icon-theme
    bibata-cursors
  ];
}
