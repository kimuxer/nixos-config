{ pkgs, ... }:

{
  # 启用 fish  shell
  programs.fish.enable = true;

  # 用户配置
  users.users.kim = {
    isNormalUser = true;
    description = "Kimuxer";
    shell = pkgs.fish;

    # 必需权限组
    extraGroups = [
      "wheel"           # sudo 权限
      "networkmanager"  # 管理网络
      "video"           # 显卡
      "audio"           # 音频
      "input"           # 输入设备
      "libvirtd"        # 虚拟机
    ];
  };
  
  users.users.naiveproxy = {
    isSystemUser = true; # 创建一个系统用户（无法登录，仅供服务使用）
    group = "naiveproxy";
  };

  users.groups.naiveproxy = {};

  # 允许 wheel 组免密 sudo（可选，但是非常舒服）
  security.doas.enable = true;
  security.sudo.wheelNeedsPassword = false;
}
