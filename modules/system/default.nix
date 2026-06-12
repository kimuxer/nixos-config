{ ... }:
{
  imports = [
    ../shared
    ./core.nix
    ./packages.nix
    ./desktop.nix
    ./kanata.nix
    ./fonts.nix
    ./starship.nix
    ./virtualisation.nix
  ];
}
