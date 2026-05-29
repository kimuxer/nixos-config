{ ... }:
{
  services.kanata = {
    enable = true;
    keyboards.default = {
      config = ''
        (defsrc
          caps ralt 1 2 3 4 5 6 7 8 9 h j k l)

        (defalias
          ;; 你原本的配置：单点 Caps，长按 Super (Meta)
          cap (tap-hold-press 150 150 caps lmet)
          
          ;; 新增：按住 ralt 进入 move_layer 层
          mv_lyr (layer-while-held move_layer)
        )

        (deflayer default
          ;; @cap 对应 Caps 逻辑
          ;; @mv_lyr 对应 ralt 逻辑
          @cap @mv_lyr 1 2 3 4 5 6 7 8 9 h j k l)

        (deflayer move_layer
          ;; 1. (caps): _ 表示保持 Caps 原有行为
          ;; 2. (ralt): _ 表示保持 RAlt 原有行为（作为层触发键，这里必须是透明/保持，否则层会立刻断开）
          _ _
          ;; M-S-1 代表 Super(Meta) + Shift + 1
          ;; 这里的 M 必须和你在 Niri 里的 Mod 定义一致
          M-S-1 M-S-2 M-S-3 M-S-4 M-S-5 M-S-6 M-S-7 M-S-8 M-S-9
          ;; h j k l 窗口互换
          M-S-h M-S-j M-S-k M-S-l)
      '';
    };
  };
}
