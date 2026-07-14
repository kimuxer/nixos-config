# -- modules/desktop/hardware.nix --
{ config, pkgs, ... }:

{
  services.fstrim.enable = true;

  security.rtkit.enable = true;
  services.pulseaudio.enable = false;

  # PipeWire + WirePlumber 全套音频
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [ nvidia-vaapi-driver ];
  };

  hardware.nvidia = {
    # 针对 1080Ti 的 legacy_580 稳定驱动
    package = config.boot.kernelPackages.nvidiaPackages.legacy_580;
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = false;
  };
}
