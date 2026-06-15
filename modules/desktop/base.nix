# -- modules/desktop/base.nix --
{ pkgs, ... }:

{
  boot = {
    kernelPackages = pkgs.linuxPackages_zen;

    kernelParams = [
      "splash"
      "nosgx"
      "nvidia-drm.fbdev=1"
      "module_blacklist=nouveau"
    ];

    loader = {
      efi.canTouchEfiVariables = true;
      limine = {
        enable = true;
        efiSupport = true;
        enableEditor = true;
        maxGenerations = 10;
        style = {
          interface.resolution = "1920x1080";
          wallpapers = [ ../../assets/limine_nixos.jpeg ];
        };
        extraConfig = ''
          graphics: yes
          wallpaper_style: stretched

          term_palette: 1e1e2e;f38ba8;a6e3a1;24ffff;89b4fa;f5c2e7;24ffff;24ffff
          term_palette_bright: 24ffff;f38ba8;a6e3a1;24ffff;89b4fa;f5c2e7;24ffff;24ffff

          # 配合这两个底层指示器，让透明遮罩完美挂载
          term_background: 80000000
          term_foreground: 24ffff

          menu_margin: 10%
          menu_margin_top: 15%
          menu_rows: 10
          menu_align: left

          # 文字高亮
          text_color: ffffffff
          text_highlight_color: ff24ffff  # 选中项呈现冰蓝色

          # 隐藏 Limine 默认的品牌文本，保持界面纯净
          interface_branding: NixOS Custom Boot

          interface_branding: ""
        '';

        extraEntries = ''
          /windows 11 pro
            protocol: efi
            path: guid(940818ba-1baa-41ad-86cb-405ee9629f74):/EFI/Microsoft/Boot/bootmgfw.efi
        '';
      };
    };
  };

  networking.hostName = "nixdevbox";
  networking.networkmanager.enable = true;

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_CTYPE = "zh_CN.UTF-8";
  };

  users.users.kim = {
    isNormalUser = true;
    description = "Kimuxer";
    shell = pkgs.fish;
    extraGroups = [
      "wheel"
      "networkmanager"
      "video"
      "audio"
      "input"
      "libvirtd"
    ];
  };

  security.sudo.wheelNeedsPassword = false;

  system.stateVersion = "26.11";
}
