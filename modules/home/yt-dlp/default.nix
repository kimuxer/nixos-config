{ ... }:
{
  programs.yt-dlp = {
    enable = true;
    settings = {
      # 基础设置
      embed-thumbnail = true;
      embed-subs = true;
      sub-langs = "all";
      # 下载优化
      downloader = "aria2c";
      downloader-args = "aria2c:'-c -x8 -s8 -k1M'";
      # 输出模板
      output = "%(title)s [%(id)s].%(ext)s";
    };
  };

  programs.aria2 = {
    enable = true;
    settings = {
      # 性能优化
      max-connection-per-server = 16;
      split = 16;
      min-split-size = "1M";

      # 保持连接与断点续传
      continue = true;
      max-concurrent-downloads = 5;
    };
  };
}
