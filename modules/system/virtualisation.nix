{ pkgs, ... }:

{
  # 1. 开启 libvirtd 虚拟化守护进程
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
    };
  };

  # 2. 开启 virt-manager 图形化管理客户端
  programs.virt-manager.enable = true;

  # 3. 启用 Spice USB 重定向（允许虚拟机直接读取你插在物理机上的 U 盘） [cite: 1.2.2]
  virtualisation.spiceUSBRedirection.enable = true;
}
