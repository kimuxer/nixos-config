{ ... }:
{
  imports = [
    ./base.nix
    ./hardware.nix
    ./hardware-configuration.nix
    ../../modules/system
  ];
}
