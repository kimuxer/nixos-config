# -- modules/desktop/packages.nix --
{ pkgs, ... }:
{
  programs.fish.enable = true;

  environment.systemPackages = with pkgs; [
    evtest
    udiskie
    btrfs-assistant
    btrfs-progs
    adw-gtk3
    papirus-icon-theme
    bibata-cursors
  ];
}
