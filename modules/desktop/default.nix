# -- modules/desktop/default.nix --
{ ... }:
{
  imports = [
    ../shared
    ./base.nix
    ./hardware.nix
    ./hardware-configuration.nix
    ./hm.nix
    ./core.nix
    ./packages.nix
    ./desktop.nix
    ./kanata.nix
    ./fonts.nix
    #./virtualisation.nix
  ];
}
