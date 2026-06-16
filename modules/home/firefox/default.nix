{ ... }: {
  programs.firefox = {
    enable = true;
    languagePacks = [ "zh-CN" ];
    
    profiles.default = {
      name = "default";
      isDefault = true;
      settings = {
        "intl.locale.requested" = "zh-CN";
        #"sidebar.verticalTabs" = true;
        #"sidebar.verticalTabs.dragToPinPromo.dismissed" = true;
        "gfx.webrender.all" = true;
        "media.hardware-video-decoding.force-enabled" = true;
        "media.ffmpeg.vaapi.enabled" = true;
        "layers.acceleration.force-enabled" = true;
        "browser.aboutConfig.showWarning" = false;
        "browser.vpn_promo.enabled" = false;
        "browser.newtabpage.activity-stream.feeds.topsites" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
      };
    };
  };
}
