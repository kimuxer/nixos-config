{ pkgs, ... }:

{
  services.xserver.enable = false;

  system.stateVersion = "26.11";

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      systemd-boot = {
        enable = true;
        # 限制旧一代配置文件的保留数量，防止软路由 /boot 分区爆满
        configurationLimit = 10;
      };
      # 允许修改 EFI 变量（anywhere 自动化安装和正常引导必需）
      efi.canTouchEfiVariables = true;
      # 软路由开机越快越好，将引导菜单倒计时缩短为 3 秒
      timeout = 3;
    };

    initrd = {
      # 极其全能的存储与 USB 驱动包（涵盖 NVMe, SATA SSD, U 盘启动）
      availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod" ];
      kernelModules = [ ];
    };
    # 开启 Intel CPU 的虚拟化支持（方便以后工控机里开 KVM 玩小虚拟机）
    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ ];

    # 3. ⚡ 软路由的灵魂：内核网络参数优化 (Sysctl)
    kernel.sysctl = {
      # 强制开启 IPv4 和 IPv6 的流量转发（不做软路由就没法转发包了）
      "net.ipv4.ip_forward" = 1;
      "net.ipv6.conf.all.forwarding" = 1;

      # 开启 BBR 拥塞控制算法（让你的 dae 代理和网络转发延迟更低、速度更稳）
      "net.core.default_qdisc" = "fq";
      "net.ipv4.tcp_congestion_control" = "bbr";

      # 优化工控机的高并发网络缓存，防止网络流量大时丢包
      "net.core.rmem_max" = 16777216;
      "net.core.wmem_max" = 16777216;
    };
  };
}
