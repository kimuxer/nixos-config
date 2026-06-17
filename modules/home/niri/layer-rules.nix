{ ... }:
{
  programs.niri.settings.layer-rules = [
    {
      # 匹配 noctalia 的背景层
      matches = [ { namespace = "^noctalia-backdrop"; } ];
      place-within-backdrop = true;
    }
    {
      matches = [ { namespace = "^noctalia-(bar-[a-zA-Z0-9_-]+|notification|dock|panel|attached-panel|osd)$"; } ];
      #matches = [
        #{ namespace = "^noctalia-bar"; }
        #{ namespace = "^noctalia-notification"; }
        #{ namespace = "^noctalia-dock"; }
        #{ namespace = "^noctalia-panel"; }
        #{ namespace = "^noctalia-attached-panel"; }
        #{ namespace = "^noctalia-osd"; }
        #];
      background-effect = {
        xray = false;
          # 关掉模糊
          # blur = false;
        };
    }
  ];
}
