{ pkgs, ... }:

{
  imports = [
    ../../modules/shared/core.nix
    ../../modules/shared/sys-utils.nix
  ];
  boot.kernelPackages = pkgs.linuxPackages_zen;

  system.stateVersion = "26.11";
}
