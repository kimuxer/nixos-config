# -- modules/desktop/default.nix --
{ inputs, ... }:
{
  imports = [
    inputs.disko.nixosModules.disko
    ../shared
    ./disko.nix
    ./base.nix
    ./hardware.nix
    ./storage.nix
    ./hm.nix
    ./core.nix
    ./desktop.nix
    ./kanata.nix
    ./fonts.nix
    ./starship.nix
    #./ollama.nix
    #./virtualisation.nix
  ];
}
