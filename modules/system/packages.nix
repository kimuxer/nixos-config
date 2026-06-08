{ pkgs, ... }:

{

  # ==============================================
  # 系统级必需程序（必须在系统层开启）
  # ==============================================
  programs.dconf.enable = true; # UI 程序通用依赖
  # 启用固件自动升级服务（KDE 的发现中心 Discover 也会调用它）
  services.fwupd.enable = true;

  # SSH 保活
  programs.ssh.extraConfig = ''
    Host *
      ServerAliveInterval 30
      ServerAliveCountMax 3
  '';

  programs.nix-ld.enable = true;
  # ==============================================
  # 系统级全局安装包（所有用户、任何环境都需要）
  # ==============================================
  environment.systemPackages = with pkgs; [
    udiskie
    btrfs-assistant
    snapper
    kdePackages.kwin # sddm 合成器
  ];
}
