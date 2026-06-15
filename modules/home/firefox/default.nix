{ pkgs, ... }: {
  programs.firefox = {
    enable = true;
    profiles.default = {
      name = "default";
      isDefault = true;

      settings = {
        # 1. 布局：自动开启垂直标签并关闭新手气泡引导
        "sidebar.verticalTabs" = true;
        "sidebar.verticalTabs.dragToPinPromo.dismissed" = true;

        # 2. 1080 Ti 显卡硬解与 WebRender 全局渲染加速
        "gfx.webrender.all" = true;
        "media.hardware-video-decoding.force-enabled" = true;
        "media.ffmpeg.vaapi.enabled" = true;
        "layers.acceleration.force-enabled" = true;

        # 3. 体验与广告净化：拒绝风险警告提示、全面砍掉新标签页广告和赞助链接
        "browser.aboutConfig.showWarning" = false;
        "browser.vpn_promo.enabled" = false;
        "browser.newtabpage.activity-stream.feeds.topsites" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
      };
    };
  };
}
