{  pkgs, ... }: 
{
  boot.initrd = {
    systemd.enable = true;
    kernelModules = [ "nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm" ];
  };

  boot.kernelParams = [
    "quiet"
    "loglevel=3"
    "splash"
    "nvidia_drm.modeset=1"
    "nvidia_drm.fbdev=1"
  ];

  boot.plymouth = {
    enable = true;
    themePackages = [ pkgs.catppuccin-plymouth ];
    theme = "catppuccin-macchiato";

  };

  boot.loader = {
    efi.canTouchEfiVariables = true;
    limine = {
      enable = true;
      efiSupport = true;
      enableEditor = true;
      maxGenerations = 10;
      style = {
        interface.resolution = "1920x1080";
      #  wallpapers = [ ];
      #  backdrop = "1E1E2E";
      #  graphicalTerminal.background = "1E1E2E";
      #  graphicalTerminal.foreground = "CDD6F4";
      #  graphicalTerminal.brightBackground = "585B70";
      #  graphicalTerminal.brightForeground = "CDD6F4";
      #  graphicalTerminal.palette = "1e1e2e;f38ba8;a6e3a1;f9e2af;89b4fa;f5c2e7;94e2d5;cdd6f4";
      #  graphicalTerminal.brightPalette= "585b70;f38ba8;a6e3a1;f9e2af;89b4fa;f5c2e7;94e2d5;cdd6f4";
      };

      extraEntries = "
        /windows 11 pro
          protocol: efi
          path: guid(940818ba-1baa-41ad-86cb-405ee9629f74):/EFI/Microsoft/Boot/bootmgfw.efi
        ";
    };
  };
}
