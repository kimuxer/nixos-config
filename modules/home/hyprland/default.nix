# modules/home/hyprland/default.nix
{ config, pkgs, inputs, lib, ... }:

{
  imports = [
    # 挂载 DMS 官方的系统层服务与登录器模块
    inputs.dms.homeModules.dank-material-shell
  ];

  # DMS 集成
  programs.dank-material-shell = {
    enable = true;
    systemd.enable = false;
    enableSystemMonitoring = true;
    dgop.package = inputs.dgop.packages.${pkgs.system}.default;
                #quickshell.package = inputs.quickshell.packages.${pkgs.system}.default;
  };
  
  home.file.".config/hypr" = {
    source = ./config; # 你所有的 .lua 文件放在这里
    recursive = true;
  };
  # 其他用户服务
  services.udiskie.enable = true;  # 确保 udiskie 作为 systemd 服务运行
}
