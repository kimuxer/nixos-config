{ inputs, ... }:

{
  imports = [
    inputs.disko.nixosModules.disko
    ./disko.nix
    ../../modules/shared
    ./base.nix
    ./boot.nix
    ./network.nix
    ./users.nix
    ./naiveproxy.nix
    ./dae.nix
    ./services.nix
  ];
}
