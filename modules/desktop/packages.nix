# -- modules/desktop/packages.nix --
{ pkgs, ... }:
{
  nixpkgs.config.permittedInsecurePackages = [
    "librewolf-bin-151.0.1-2"
  ];
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
