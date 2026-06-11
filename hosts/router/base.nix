{ pkgs, ... }:

{
  boot.kernelPackages = pkgs.linuxPackages_latest;

  services.xserver.enable = false;

  system.stateVersion = "26.11";
}
