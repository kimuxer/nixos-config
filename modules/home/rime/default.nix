{ pkgs, ... }:

let
  # 魔法 1：直接在 Nix Store 里在线打捞并打包 KyleBing 的极点五笔
  rime-wubi86-jidian = pkgs.stdenvNoCC.mkDerivation {
    pname = "rime-wubi86-jidian";
    version = "2026-06";

    src = pkgs.fetchFromGitHub {
      owner = "KyleBing";
      repo = "rime-wubi86-jidian";
      rev = "master";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };

    installPhase = ''
      mkdir -p $out/share/rime-data

      # 瘦身手术：删掉不属于 Rime 核心的说明文档、图片和第三方键盘配置
      rm -rf ./.git ./.github ./仓键盘布局 ./imgs
      rm -f README.md LICENSE *.md

      # 重点：把极点五笔全家桶全部打包进 Nix Store
      cp -r ./* $out/share/rime-data
    '';
  };
in
{
  home-manager.users.kim = {
    # 自定义简繁切换键，防止和 Zed 等编辑器全局搜索冲突
    xdg.configFile = {
      "fcitx5/conf/chttrans.conf" = {
        force = true;
        text = ''
          [Global]
          Engine=OpenCC
          OpenCCS2TProfile=default
          OpenCCT2SProfile=default

          [Hotkey]
          0=ControlL+Shift+Alt+L
        '';
      };
    };

    home.file = {
      # 修复点 1：变量名修正为 rime-wubi86-jidian
      ".local/share/fcitx5/rime" = {
        source = "${rime-wubi86-jidian}/share/rime-data";
        recursive = true;
        onChange = ''
          mkdir -p ~/.local/share/fcitx5/rime
          chmod -R u+w ~/.local/share/fcitx5/rime
          rm -f ~/.local/share/fcitx5/rime/*.bin
          rm -f ~/.local/share/fcitx5/rime/build/*
        '';
      };

      # 依据 图片_7.png 的同级目录相对路径映射
      ".local/share/fcitx5/rime/default.custom.yaml" = {
        source = ./default.custom.yaml;
        force = true;
      };

      # 依据 图片_7.png，把同级 themes 目录下的 theme.conf 完美打包进暗绿皮肤文件夹
      ".local/share/fcitx5/themes/mint-green-dark" = {
        source = ./themes;
        recursive = true;
      };
    };
  };

  i18n = {
    inputMethod = {
      type = "fcitx5";
      enable = true;
      fcitx5 = {
        waylandFrontend = true;
        addons = with pkgs; [
          qt6Packages.fcitx5-configtool
          fcitx5-gtk
          qt6Packages.fcitx5-qt
          fcitx5-lua
          librime-lua
          fcitx5-rime
          rime-wubi86-jidian # 核心极点依赖
        ];
        settings = {
          addons = {
            classicui.globalSection = {
              # 完美对齐你的 mint-green-dark 皮肤
              Theme = "mint-green-dark";
              DarkTheme = "mint-green-dark";
            };
          };
          inputMethod = {
            "Groups/0" = {
              Name = "Default";
              "Default Layout" = "us";
            };
            "Groups/0/Items/0" = {
              Name = "keyboard-us"; # 开机默认纯英文，保护极客优雅
            };
            "Groups/0/Items/1" = {
              Name = "rime";        # Ctrl + Space 呼出五笔
            };
            GroupOrder = {
              "0" = "Default";
            };
          };
        };
      };
    };
  };
}
