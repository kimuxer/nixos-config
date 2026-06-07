{ ... }:

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
}
