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
          # 刚度 (stiffness) 调低一点，让它感觉像是一个沉重的窗口在慢慢弹出
          stiffness = 1200;
          # 阻尼 (damping) 调高一点，让它在弹到位的时候迅速停住，不要乱晃
          damping-ratio = 1.0; # 设为 1.0 即为“临界阻尼”，没有任何多余的震荡
          epsilon = 0.001;
        };
      };
    };

    # 横向移动动画
    horizontal-view-movement = {
      enable = true;
      kind = {
        spring = {
          # 适当的刚度和阻尼，模拟一种“有质量的视口滑动”
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

    # ⚡ 窗口动画节点
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
