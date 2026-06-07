{ pkgs, lib, ... }:

{
  # 系统纯净策略：清空 NixOS 预装无用包
  environment.defaultPackages = lib.mkForce [ ];

  # 启用固件自动升级服务（KDE 的发现中心 Discover 也会调用它）
  #services.fwupd.enable = true;
  #programs.nix-ld.enable = true;

  services.xserver.enable = false;

  # ==============================================
  # 系统级全局安装包（所有用户、任何环境都需要）
  # ==============================================
  environment.systemPackages = with pkgs; [
    # --------------------------
    # 底层系统运维工具
    # --------------------------
    sops
    git
    curl
    wget
    unzip
    p7zip
    jq
    file
    killall

    # --------------------------
    # 网络调试工具 (配合 dae 绝佳)
    # --------------------------
    dnsutils # 提供 dig, nslookup 命令，方便测试 DNS 转发
    # --------------------------
    # 硬件查询与维护
    # --------------------------
    hwinfo
    pciutils
    usbutils
    parted # 核心分区工具
    smartmontools # 硬盘健康状态监控

    # --------------------------
    # 现代必装 CLI 工具（系统级全局）
    # --------------------------
    eza
    bat
    ripgrep
    fd
    bottom
    procs
    dust
    duf
    tealdeer
    fastfetch
    helix
  ];
}
