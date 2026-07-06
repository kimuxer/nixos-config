{ ... }:

let
  fileName = "${config.home.homeDirectory}/Pictures/Screenshots/satty-%Y%m%d-%H%M%S.png";
in
{
  programs.satty = {
    enable = true;
    settings = {
      general = {
        output-filename = fileName;
        early-exit = [ "all" ];
        actions-on-enter = [
          "save-to-file"
          "save-to-clipboard"
        ];

        # --- 窗口尺寸控制 ---
        fullscreen = false; # 确保关闭全屏
        # 设置初始大小，width 1200, height 800 在 1080p 下非常和谐
        resize = {
          mode = "size";
          width = 1200;
          height = 800;
        };
      };
    };
  };
}
