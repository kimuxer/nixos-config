{  ... }:

{
  programs.niri.settings.animations = {
    # ⚡ 基础开关与速率
    enable = true;
    slowdown = 0.9;

    # 通知窗口动画
    config-notification-open-close = {
      enable = true;
      kind = {
        easing = {
          curve = "ease-out-expo";
          duration-ms = 250;
        };
      };
    };
    # 退出窗口动画
    exit-confirmation-open-close = {
      enable = true;
      kind = {
        spring = {
          stiffness = 1200;
          damping-ratio = 1.0;
          epsilon = 0.001;
        };
      };
    };

    # 横向移动动画
    horizontal-view-movement = {
      enable = true;
      kind = {
        spring = {
          stiffness = 1000;
          damping-ratio = 1.0;
          epsilon = 0.001;
        };
      };
    };

    # 窗口移动动画
    window-movement = {
      enable = true;
      kind = {
        easing = {
          curve = "ease-out-cubic";
          duration-ms = 150;
        };
      };
    };

    # 概览动画
    overview-open-close = {
      enable = true;
      kind = {
        easing = {
          curve = "ease-out-expo";
          duration-ms = 350;
        };
      };
    };

    # 截图
    screenshot-ui-open = {
      enable = true;
      kind = {
        easing = {
          curve = "ease-out-expo";
          duration-ms = 200;
        };
      };
    };

    # 窗口动画配置
    window-open = {
      enable = true;
      kind = {
        spring = {
          stiffness = 1000;
          damping-ratio = 1.0;
          epsilon = 0.001;
        };
      };
    };

    window-close = {
      enable = true;
      kind = {
        easing = {
          curve = "ease-out-quad";
          duration-ms = 150;
        };
      };
    };

    workspace-switch = {
      enable = true;
      kind = {
        easing = {
          curve = "ease-out-expo";
          duration-ms = 350;
        };
      };
    };

    window-resize = {
      enable = true;
      kind = {
        easing = {
          curve = "ease-out-expo";
          duration-ms = 150;
        };
      };
    };
  };
}
