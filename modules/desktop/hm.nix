# -- modules/desktop/hm.nix --
{ inputs, ... }:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
    overwriteBackup = true;

    extraSpecialArgs = { inherit inputs; };

    users.kim = {
      imports = [ ../../modules/home ];
    };
  };
}
