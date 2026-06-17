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
          wallpapers = [ ../../assets/limine_nixos.jpeg ];
          interface = {
            resolution = "1920x1080";
          };

          graphicalTerminal = {
            margin = 200;
            marginGradient = 15;
            background = "80000000";
            brightBackground = "ffffffff";
            foreground = "24ffff";
            brightForeground = "ff24ffff";
            palette = "1e1e2e;f38ba8;a6e3a1;24ffff;89b4fa;f5c2e7;24ffff;24ffff";
            brightPalette = "24ffff;f38ba8;a6e3a1;24ffff;89b4fa;f5c2e7;24ffff;24ffff";
          };
        };
        extraConfig = ''
          term_font: ${../../assets/LB_OCR.F16}
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
