# -- modules/home/packages/default.nix --
{
  pkgs,
  inputs,
  config,
  ...
}:

let
  fileName = "${config.home.homeDirectory}/Pictures/Screenshots/satty-%Y%m%d-%H%M%S.png";
in
{
  programs.bat.enable = true;
  programs.ripgrep.enable = true;
  programs.bottom.enable = true;

  programs.eza = {
    enable = true;
    icons = "auto";
    colors = "auto";
    enableFishIntegration = true;
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableFishIntegration = true;
  };

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

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.tealdeer = {
    enable = true;
    settings = {
      updates = {
        auto_update = true;
        auto_update_interval_hours = 168;
      };
    };
  };

  programs.nh = {
    enable = true;
    flake = "/home/kim/nixos-config";
    clean = {
      enable = true;
      extraArgs = "--keep 5 --keep-since 3d";
    };
  };

  home.packages = [
    # 聊天
    pkgs.telegram-desktop
    pkgs.wechat

    # 影音
    pkgs.termusic # tui 音乐播放器
    pkgs.ffmpeg # 必须：负责将抓取的音频转码为 MP3/FLAC 并写入歌曲标签
    # CLI 工具
    pkgs.wl-clipboard
    pkgs.procs
    pkgs.dust
    pkgs.duf
    pkgs.nixd
    pkgs.alejandra   # nix代码格式化工具
    pkgs.llvmPackages.lldb
    pkgs.vscode-extensions.vadimcn.vscode-lldb
  ];
}
