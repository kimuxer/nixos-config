# -- modules/home/nix-index/default.nix --
{ inputs, ... }:
{
  imports = [
    inputs.nix-index-database.hmModules.nix-index
  ];

  programs.nix-index = {
    enable = true;
    enableFishIntegration = true;
  };
  programs.nix-index-database.comma.enable = true;
}
