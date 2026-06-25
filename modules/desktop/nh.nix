# -- modules/desktop/nh.nix --
{ ... }:

{
  programs.nh = {
    enable = true;
    flake = "/home/kim/nixos-config";
    clean = {
      enable = true;
      extraArgs = "--keep 5 --keep-since 3d";
    };
  };
}
