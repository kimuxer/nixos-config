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
    ./gtklock.nix
    #./sops.nix
    #./hyprland.nix
  ];
}

