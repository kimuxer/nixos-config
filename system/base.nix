{ inputs, pkgs, ... }:

{
  # 最新内核
  boot.kernelPackages = pkgs.linuxPackages_latest;
  hardware.cpu.intel.updateMicrocode = true;

  # Nix 存储优化
  nix.settings.auto-optimise-store = true;

  # 自动垃圾回收
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  # Flake 锁定（让 nix shell 直接用当前 flake 的 nixpkgs）
  nix.registry.nixpkgs.flake = inputs.nixpkgs;
  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

  system.stateVersion = "26.05";
}
