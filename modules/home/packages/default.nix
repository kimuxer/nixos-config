# -- modules/home/packages/default.nix --
{ pkgs, ... }:
{
  programs.bat.enable = true;
  programs.bottom.enable = true;
  programs.ripgrep.enable = true;
  programs.fd = {
    enable = true;
    hidden = true;
    ignores = [
      ".git/"
      "*.bak"
      "build/"
      "dist/"
      "node_modules/"
      "result/"
      ".direnv/"
    ];
  };
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

  programs.zoxide = {
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
    pkgs.llvmPackages.lldb
    pkgs.vscode-extensions.vadimcn.vscode-lldb
  ];
}
