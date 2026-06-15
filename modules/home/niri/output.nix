{ ... }:{
  programs.niri.settings.outputs = {
    # 这里的 key 是你的端口名
    "HDMI-A-1" = {
      enable = true;
      mode = {
          height = 1080;
          width = 1920;
          refresh = 60.000;
      };

      # 对应 KDL 中的 scale 属性
      scale = 1.0;

      # 如果需要设置位置，可以添加：
      # position = { x = 0; y = 0; };
    };
  };
}
