{ inputs, ... }:

{
  imports = [
    inputs.disko.nixosModules.disko
    ./disko.nix
    ./base.nix
    ./boot.nix
    ./network.nix
    ./users.nix
    ./packages.nix
    ./naiveproxy.nix
    ./dae.nix
  ];
}
