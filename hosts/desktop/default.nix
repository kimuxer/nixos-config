{ ... }:
{
  imports = [
    ./base.nix
    ./boot.nix
    ./env.nix
    ./network.nix
    ./users.nix
    ./hardware
    ../../modules/system
    ../../modules/shared
  ];
}
