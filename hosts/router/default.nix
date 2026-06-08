{ inputs, ... }:

{
  imports = [
    inputs.disko.nixosModules.disko
    ./disko.nix
    ./base.nix
    ./boot.nix
    ./network.nix
    ./users.nix
    ./naiveproxy.nix
    ./dae.nix
    ./services.nix
  ];
}
