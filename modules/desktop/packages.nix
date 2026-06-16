# -- modules/desktop/packages.nix --
{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    udiskie
    btrfs-assistant
    snapper
    kdePackages.kwin # sddm 合成器
    adw-gtk3
    papirus-icon-theme
    bibata-cursors
  ];
}
