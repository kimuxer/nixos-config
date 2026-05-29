{ inputs, pkgs, ... }:

{
  # 1. 内核与系统引导（已切换为 Zen 内核，并删除了多余的微码配置）
  boot.kernelPackages = pkgs.linuxPackages_zen;

  # 2. 内存优化：ZRAM（仅保留必要控制，删除冗余的算法和低 swappiness 限制）
  # 提示：NixOS 默认会分配合理的 swappiness，无需手动将其压低到 10
  zramSwap = {
    enable = true;
    memoryPercent = 25; # 限制 ZRAM 最多占用 25% 的物理内存
  };

  # 3. Nix 包管理器与存储优化（将分散的 nix 属性合并，去除冗余前缀）
  nix = {
    # 存储优化与自动垃圾回收
    settings.auto-optimise-store = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };

    # Flake 锁定：让本地 nix-shell/nix run 直接复用当前配置的 nixpkgs
    registry.nixpkgs.flake = inputs.nixpkgs;
    nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
  };

  # 4. 系统状态版本
  system.stateVersion = "26.05";
}
