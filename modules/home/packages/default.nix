{ pkgs, inputs, ... }:

{
  programs.bat.enable = true;
  programs.ripgrep-all.enable = true;
  programs.bottom.enable = true;

  programs.eza = {
    enable = true;
    icons = "auto";
    colors = "auto";
    enableFishIntegration = true;
  };

  programs.fd = {
    enable = true;
    hidden = true;
  };
  programs.tealdeer = {
    enable = true;
    settings.updates = {
      auto_update = true;
      auto_update_interval_hours = 24;
    };
  };
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableFishIntegration = true;
  };

  home.packages = [
    # 浏览器
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default

    # noctalia 截图编辑
    pkgs.satty

    # 聊天
    pkgs.telegram-desktop
    pkgs.wechat

    # 影音
    pkgs.mpv # 视频播放
    pkgs.termusic # tui 音乐播放器
    pkgs.yt-dlp # 必须：负责全网搜歌、抓取下载
    pkgs.ffmpeg # 必须：负责将抓取的音频转码为 MP3/FLAC 并写入歌曲标签
    # CLI 工具
    pkgs.wl-clipboard
    pkgs.fastfetch
    pkgs.procs
    pkgs.dust
    pkgs.duf
    pkgs.nixd
    pkgs.nil
    pkgs.llvmPackages.lldb
    pkgs.vscode-extensions.vadimcn.vscode-lldb
  ];

  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";
    _JAVA_AWT_WM_NONREPARENTING = "1";
    EDITOR = "nvim";
    VISUAL = "nvim";
  };
}
