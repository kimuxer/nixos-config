# modules/shared/default.nix
{
  inputs,
  pkgs,
  lib,
  ...
}:
{
  imports = [
    ./sops.nix
    ./run0.nix
    ./network.nix
  ];

  nix = {
    channel.enable = false;
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      nix-path = "nixpkgs=flake:nixpkgs";
      trusted-users = [
        "root"
        "@wheel"
      ];
    };

    registry = lib.mapAttrs (_: flake: { inherit flake; }) (
      lib.filterAttrs (_: lib.isType "flake") inputs
    );
    nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
  };

  nixpkgs.config.allowUnfree = true;
  time.timeZone = "Asia/Shanghai";

  zramSwap = {
    enable = true;
  };

  environment.defaultPackages = lib.mkForce [ ];

  environment.systemPackages = with pkgs; [
    sops
    git
    curl
    wget
    unzip
    p7zip
    jq
    file
    killall
    hwinfo
    pciutils
    usbutils
    parted
    smartmontools
    helix
  ];
}
