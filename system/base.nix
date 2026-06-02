{ inputs, pkgs, lib, ... }:

{
  boot.kernelPackages = pkgs.linuxPackages_zen;

  zramSwap = {
    enable = true;
    memoryPercent = 25; # 限制 ZRAM 最多占用 25% 的物理内存
  };

  nix = {
    channel.enable = false;
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
      nix-path = "nixpkgs=flake:nixpkgs";
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    registry = lib.mapAttrs (_: flake: { inherit flake; }) (
      lib.filterAttrs (_: lib.isType "flake") inputs
    );
    nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
  };

  nixpkgs.config.allowUnfree = true;

  # 4. 系统状态版本
  system.stateVersion = "26.11";
}
