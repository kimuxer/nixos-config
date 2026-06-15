{ ... }:
{
  programs.niri.settings.layer-rules = [
    {
      # 匹配 noctalia 的背景层
      matches = [ { namespace = "^noctalia-backdrop"; } ];
      # 这里使用 place-within-backdrop
      place-within-backdrop = true;
    }
#    {

#       matches = [ { namespace = "^noctalia-(bar-[^\"]+|notification|dock|panel|attached-panel|osd)$"; } ];
#    }
  ];
}
