{ pkgs, ... }:

{
  imports = [
    ../../modules/shared/core.nix
    ../../modules/shared/sys-utils.nix
  ];

  boot.kernelPackages = pkgs.linuxPackages_latest;

  services.xserver.enable = false;

  system.stateVersion = "26.11";
}
