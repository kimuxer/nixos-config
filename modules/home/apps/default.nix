{ pkgs, inputs, ... }:

{

  home.packages = [
    pkgs.fastfetch
    # 浏览器
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default

    # 代码编辑器
    pkgs.zed-editor

    # 聊天
    pkgs.telegram-desktop
    pkgs.wechat

    # 影音
    pkgs.mpv          # 视频播放
    pkgs.termusic     # tui 音乐播放器
    pkgs.yt-dlp       # 必须：负责全网搜歌、抓取下载
    pkgs.ffmpeg       # 必须：负责将抓取的音频转码为 MP3/FLAC 并写入歌曲标签
  ];
}
