# -- modules/desktop/base.nix --
{ config, pkgs, modulesPath, lib, ... }:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  boot = {
    kernelPackages = pkgs.linuxPackages_zen;
    initrd.availableKernelModules = [ "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];
    initrd.kernelModules = [ ];
    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ ];

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
            branding = " ";
          };

          graphicalTerminal = {
            margin = 0;
            marginGradient = 0;
            background = "8024273a";
            brightBackground = "ff5b6078";
            foreground = "cad3f5";
            brightForeground = "ffcad3f5";
            palette = "24273a;ed8796;a6da95;eed49f;8aadf4;f5bde6;8bd5ca;cad3f5";
            brightPalette = "5b6078;ed8796;a6da95;eed49f;8aadf4;f5bde6;8bd5ca;cad3f5";
          };
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

  system.stateVersion = "26.11";
}
