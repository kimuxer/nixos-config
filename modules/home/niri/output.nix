{ ... }:{
  programs.niri.settings.outputs = {
    "HDMI-A-1" = {
      enable = true;
      mode = {
          height = 1080;
          width = 1920;
          refresh = 60.000;
      };
      scale = 1.0;
    };
  };
}
