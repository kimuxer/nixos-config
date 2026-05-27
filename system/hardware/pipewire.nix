{  ... }:

{
  services.pulseaudio.enable = false;
  # 实时权限，防止音频卡顿
  security.rtkit.enable = true;

  # PipeWire + WirePlumber 全套音频
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };
}
