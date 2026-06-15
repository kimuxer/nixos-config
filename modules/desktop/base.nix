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
        };
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
