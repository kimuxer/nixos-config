{ ... }:
{
  imports = [
    ./base.nix
    ./boot.nix
    ./env.nix
    ./network.nix
    ./users.nix
    ./home-manager.nix
    ./hardware  
  ];
  services.desktopManager.plasma6.enable = true;
  #services.displayManager.ly.enable = true;
}
