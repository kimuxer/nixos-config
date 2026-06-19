
# modules/shared/run0.nix
{ ... }:

{
  security.sudo.enable = false;
  
  security.run0 = {
    enable = true;
    enableSudoAlias = true;
    wheelNeedsPassword = false;
  };
  system.tools.nixos-rebuild.enableRun0Elevation = true;
}
