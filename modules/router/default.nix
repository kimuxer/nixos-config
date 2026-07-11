{ inputs, ... }:

{
  imports = [
    inputs.disko.nixosModules.disko
    ./disko.nix
    ../shared
    ./base.nix
    ./network.nix
    ./users.nix
    ./naiveproxy.nix
    ./dae.nix
    ./services.nix
  ];
}
