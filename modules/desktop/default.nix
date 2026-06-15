{ ... }:
{
  imports = [
    ../shared
    ./base.nix
    ./hardware.nix
    ./hardware-configuration.nix
    ./homemanager.nix
    ./core.nix
    ./packages.nix
    ./desktop.nix
    ./kanata.nix
    ./fonts.nix
    #./virtualisation.nix
  ];
}
