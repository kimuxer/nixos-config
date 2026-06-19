{ pkgs, ... }:
{
  programs.librewolf = {
    enable = true;
    package = pkgs.librewolf-bin;

    # 【语言包支持】通过 Nix 下载简体中文
    languagePacks = [ "zh-CN" ];

    profiles.default = {
      id = 0;
      isDefault = true;

      settings = {
        # ==========================================
        # 1. 语言与界面控制 (Localization & UI)
        # ==========================================
        # 界面强制显示中文
        "intl.locale.requested" = "zh-CN";
        # 开启原生垂直标签页
        "sidebar.verticalTabs" = true;
        # 关闭垂直标签页的拖拽固定功能新手引导提示
        "sidebar.verticalTabs.dragToPinPromo.dismissed" = true;

        # ==========================================
        # 2. 满血性能释放 (GPU Acceleration & WebGL)
        # ==========================================
        # 强开 WebRender 全网页显卡硬件加速渲染
        "gfx.webrender.all" = true;
        # 启用 WebGL，保证 3D 网页、地图或部分前端组件正常渲染
        "webgl.disabled" = false;

        # ==========================================
        # 3. 视频流硬件解码 (Hardware Video Decoding)
        # ==========================================
        # 强开视频流显卡硬解总开关
        "media.hardware-video-decoding.force-enabled" = true;
        # 激活 Linux 底层的 VA-API 接口以对接显卡驱动
        "media.ffmpeg.vaapi.enabled" = true;

        # ==========================================
        # 4. 日常数据持久化 (Data Retention & Login)
        # ==========================================
        # 关闭浏览器时不抹除数据
        "privacy.sanitize.sanitizeOnShutdown" = false;
        # 保留历史记录，防止重启或 rebuild 后丢失
        "privacy.clearOnShutdown.history" = false;
        # 保留 Cookie 状态，免去每次重新登录网站的麻烦
        "privacy.clearOnShutdown.cookies" = false;
        # 允许浏览器保存和自动填充网站密码
        "signon.rememberSignons" = true;

        # ==========================================
        # 5. 插件权限放行 (Extensions Control)
        # ==========================================
        # 允许自动启用手动安装的扩展，不需要每次去扩展页面手动点允许
        "extensions.autoDisableScopes" = 0;

        # ==========================================
        # 6. 使用FPP替换RFP
        # ==========================================
        # 必须先关闭 LibreWolf 默认的 RFP 开关，否则它会覆盖 FPP
        "privacy.resistFingerprinting" = false;
        # 启用 FPP 指纹保护
        "privacy.fingerprintingProtection" = true;
        # 让 FPP 拦截所有已知的指纹收集目标
        "privacy.fingerprintingProtection.pbMode" = true; # 隐私模式下同样开启
        # 允许网页读取你 Linux 系统的真实时区（不再被强制锁定为格林威治 UTC 时间）
        "privacy.resistFingerprinting.reduceTimerPrecision.customValue" = 20; # 保持高精度的计时器保护
      };
    };
  };
}
