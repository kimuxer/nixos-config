# -- modules/desktop/default.nix --
{ inputs, ... }:
{
  imports = [
    inputs.disko.nixosModules.disko
    ../shared
    ./disko.nix
    ./base.nix
    ./hardware.nix
    #./hardware-configuration.nix
    ./hm.nix
    ./core.nix
    ./packages.nix
    ./desktop.nix
    ./kanata.nix
    ./fonts.nix
    #./virtualisation.nix
  ];
}
