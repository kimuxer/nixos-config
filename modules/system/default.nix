{ ... }:
{
  imports = [
    ./packages.nix
    ./virtualisation.nix
    ./desktop.nix
    ./kanata.nix
    ./naiveproxy.nix
    ./dae.nix
    ./fonts.nix
    ./starship.nix
    #./sops.nix
    #./hyprland.nix
  ];
}

