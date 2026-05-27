{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./btrfs.nix
    ./nvidia.nix
    ./pipewire.nix
    ./input.nix 
  ];
}
