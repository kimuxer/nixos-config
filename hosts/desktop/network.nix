{ ... }:

{
  # --- 1. 物理机身份设定 ---
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  time.timeZone = "Asia/Shanghai";

  # 开启 SSH 方便远程管理（如果不需要可以去掉）
  services.openssh.enable = false;
}
