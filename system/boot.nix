{  pkgs, ... }: 
{
  boot = {
    initrd = {
      systemd.enable = true;
      kernelModules = [ "nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm" ];
    };

    kernelParams = [
      #"quiet"
      #"loglevel=3" 
      #"splash" 
      "nosgx"
      "nvidia_drm.modeset=1"
      "nvidia_drm.fbdev=1"
      "video=efifb:off"           # 物理屏蔽 EFI framebuffer
      "video=vesafb:off"          # 物理屏蔽 VESA framebuffer
      #"video=simpledrm:off"       # 这是一个较新的参数，能直接让 simpledrm 放弃探测
      "module_blacklist=nouveau"  # 再补一道内核参数拉黑
    ];

  #  boot.plymouth = {
  #    enable = true;
  #    themePackages = [ pkgs.catppuccin-plymouth ];
  #    theme = "catppuccin-macchiato";

   # };

    loader = {
      efi.canTouchEfiVariables = true;
      limine = {
        enable = true;
        efiSupport = true;
        enableEditor = true;
        maxGenerations = 10;
       # style = {
       #   interface.resolution = "1920x1080";
       # };
        extraEntries = "
          /windows 11 pro
            protocol: efi
            path: guid(940818ba-1baa-41ad-86cb-405ee9629f74):/EFI/Microsoft/Boot/bootmgfw.efi
          ";
      };
    };
  };
}
