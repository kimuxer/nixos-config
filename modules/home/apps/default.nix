{ pkgs, inputs, ... }:

{
  programs.eza.enable = true;
  programs.bat.enable = true;
  programs.ripgrep.enable = true;
  programs.fd.enable = true;
  programs.tealdeer.enable = true;
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableFishIntegration = true;
  };

  home.packages = [
    pkgs.fastfetch
    # 浏览器
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default

    # 代码编辑器
    #pkgs.zed-editor

    # 聊天
    pkgs.telegram-desktop
    pkgs.wechat

    # 影音
    pkgs.mpv          # 视频播放
    pkgs.termusic     # tui 音乐播放器
    pkgs.yt-dlp       # 必须：负责全网搜歌、抓取下载
    pkgs.ffmpeg       # 必须：负责将抓取的音频转码为 MP3/FLAC 并写入歌曲标签
    # CLI 工具
    pkgs.wl-clipboard
    pkgs.fastfetch
    pkgs.bottom
    pkgs.procs
    pkgs.dust
    pkgs.duf
    pkgs.nixd
    pkgs.nil
    pkgs.llvmPackages.lldb
    pkgs.vscode-extensions.vadimcn.vscode-lldb
  ];
  
  # 之前在环境文件里的全局个人变量，也安全地放在这里
  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";
    _JAVA_AWT_WM_NONREPARENTING = "1";
    EDITOR = "nvim";
    VISUAL = "nvim";
  };
}
