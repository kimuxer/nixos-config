{ config, pkgs, ... }:

let
  # Btrfs 公共挂载参数（你写的完全正确）
  commonOptions = [
    "noatime"
    "compress=zstd"
    "space_cache=v2"
    "commit=120"
  ];

in
{
  # SSD 优化
  services.fstrim.enable = true;

  # 所有子卷共用挂载参数
  fileSystems = {
    "/"                 = { options = commonOptions; };
    "/home"             = { options = commonOptions; };
    "/nix"              = { options = commonOptions; };
    "/var/log"          = { options = commonOptions; };
    "/var/cache"        = { options = commonOptions; };
    "/home/.snapshots"  = { options = commonOptions; };

    # Swap 不需要压缩，单独配置
    "/swap" = {
      options = [ "noatime" "space_cache=v2" ];
    };
  };

  # Swap file (Btrfs 已正确对齐)
  swapDevices = [
    { device = "/swap/swapfile"; }
  ];
  
  services.snapper = {
    configs = {
      home = {
        SUBVOLUME = "/home";
        ALLOW_USERS = [ "kim" ];
        TIMELINE_CREATE = true;
        TIMELINE_CLEANUP = true;
        TIMELINE_LIMIT_HOURLY = 5;
        TIMELINE_LIMIT_DAILY = 3;
        TIMELINE_LIMIT_WEEKLY = 1;
        TIMELINE_LIMIT_MONTHLY = 0;
        TIMELINE_LIMIT_YEARLY = 0;
      };
    };
  };

  #i18n.defaultLocale = "en_US.UTF-8";
  i18n.defaultLocale = "zh_CN.UTF-8";
  #i18n.extraLocaleSettings = {
  #  LC_CTYPE = "zh_CN.UTF-8";
  #};
  i18n.inputMethod = {
    enable = true; 
    type = "fcitx5"; 
    fcitx5 = {
      waylandFrontend = true;
      addons = with pkgs; [
        qt6Packages.fcitx5-chinese-addons 
        qt6Packages.fcitx5-configtool
        qt6Packages.fcitx5-qt
        fcitx5-gtk
        fcitx5-lua
        fcitx5-fluent
      ];
    };
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [ nvidia-vaapi-driver ];
  };

  hardware.nvidia = {
    # 针对 1080Ti 的 legacy_580 稳定驱动
    package = config.boot.kernelPackages.nvidiaPackages.legacy_580;
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = false;
  };

  services.pulseaudio.enable = false;
  # 实时权限，防止音频卡顿
  security.rtkit.enable = true;

  # PipeWire + WirePlumber 全套音频
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };
}
