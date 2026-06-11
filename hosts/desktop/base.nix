{ pkgs, ... }:

{
  boot.kernelPackages = pkgs.linuxPackages_zen;

  system.stateVersion = "26.11";
}
