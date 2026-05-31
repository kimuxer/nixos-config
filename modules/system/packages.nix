{ pkgs, lib, ... }:

{
  # 系统纯净策略：清空 NixOS 预装无用包
  environment.defaultPackages = lib.mkForce [];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableFishIntegration = true;
    enableBashIntegration = true;
  };

  programs = {
    # 系统级编辑器（所有用户可用）
    neovim = {
      enable = true;
      package = pkgs.neovim-unwrapped;
    };
  };

  # ==============================================
  # 系统级必需程序（必须在系统层开启）
  # ==============================================
  programs.dconf.enable = true; # UI 程序通用依赖


  # Qt 平台启用（Wayland + 主题必需）
  qt.enable = true;

  # ==============================================
  # 系统级全局安装包（所有用户、任何环境都需要）
  # ==============================================
  environment.systemPackages = with pkgs; [
    # --------------------------
    # 底层系统运维工具
    # --------------------------
   # sops
    git
    curl
    wget
    unzip
    p7zip
    jq
    file
    killall
    wl-clipboard
    udiskie
    # --------------------------
    # 网络调试工具 (配合 dae 绝佳)
    # --------------------------
    dnsutils                # 提供 dig, nslookup 命令，方便测试 DNS 转发
    
    # --------------------------
    # btrfs 快照工具
    # --------------------------
    btrfs-assistant
    snapper

    # --------------------------
    # 硬件查询与维护
    # --------------------------
    hwinfo
    pciutils
    usbutils
    parted                  # 核心分区工具
    smartmontools           # 硬盘健康状态监控

    # --------------------------
    # Nix 开发与维护工具
    # --------------------------
    nil # Nix LSP

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
    #fastfetch

    # --------------------------
    # 系统级主题 / 光标 / 外观
    # --------------------------
    bibata-cursors
    papirus-icon-theme

    # --------------------------
    # Qt 6 gtk3 配置与主题（全局生效）
    # --------------------------
    kdePackages.kwin  # sddm 合成器
    qt6Packages.qt6ct
    adw-gtk3
    qt6Packages.qtstyleplugin-kvantum
  ];
}
