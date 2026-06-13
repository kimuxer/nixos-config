{ pkgs, ... }:

{
  programs.fish.enable = true;

  environment.systemPackages = with pkgs; [
    udiskie
    btrfs-assistant
    snapper
    kdePackages.kwin # sddm 合成器
    bibata-cursors
  ];
}
