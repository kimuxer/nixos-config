{ pkgs, ... }:

let
  # 魔法 1：直接在 Nix Store 里在线打捞并打包 KyleBing 的极点五笔
  rime-wubi86-jidian = pkgs.stdenvNoCC.mkDerivation {
    pname = "rime-wubi86-jidian";
    version = "2026-06"; # 保持最新鲜的版本标识

    src = pkgs.fetchFromGitHub {
      owner = "KyleBing";
      repo = "rime-wubi86-jidian";
      # 建议使用主分支的最前沿提交，或者指定特定 tag
      rev = "master";
      # 提示：首次构建时 Nix 会报错提示 hash 不符，换成它提示的正确 sha256 即可
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };

    installPhase = ''
      mkdir -p $out/share/rime-data

      # 瘦身手术：删掉不属于 Rime 核心的说明文档和配套工具
      rm -rf ./.git ./.github ./仓键盘布局 ./imgs
      rm -f README.md LICENSE *.md

      # 重点：把极点五笔全家桶（wubi86_jidian.* 等所有文件）全部打包进 Nix Store
      cp -r ./* $out/share/rime-data
    '';
  };
in
{
  home-manager.users.kim = {
    # 自定义简繁切换键，防止冲突
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
      ".local/share/fcitx5/rime" = {
        source = "${rime-jidian}/share/rime-data";
        recursive = true;
        onChange = ''
          mkdir -p ~/.local/share/fcitx5/rime
          chmod -R u+w ~/.local/share/fcitx5/rime
          rm -f ~/.local/share/fcitx5/rime/*.bin
          rm -f ~/.local/share/fcitx5/rime/build/*
        '';
      };

      ".local/share/fcitx5/rime/default.custom.yaml" = {
        source = ./default.custom.yaml;
        force = true;
      };
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
        # 核心桥梁：只保留最纯粹、绝对不会乱跳、支持 Lua 的组件
        addons = with pkgs; [
          qt6Packages.fcitx5-configtool
          fcitx5-gtk
          qt6Packages.fcitx5-qt
          fcitx5-lua
          librime-lua
          fcitx5-rime
          rime-wubi86-jidian
        ];
        settings = {
          addons = {
            classicui.globalSection = {
              # 这里强行换上你昨晚精心调校的“碧月青圆角暗绿”皮肤或者 adw 主题皮肤
              Theme = "mint-green-dark";
              DarkTheme = "mint-green-dark";
            };
          };
          inputMethod = {
            "Groups/0" = {
              Name = "Default";
              "Default Layout" = "us"; # 核心底座：依然是标准美式键盘
            };
            # 列表里放两个人：0号是英文键盘，1号是你的极点五笔
            "Groups/0/Items/0" = {
              Name = "keyboard-us"; # 开机默认是纯英文，怎么敲都不会打出中文
            };
            "Groups/0/Items/1" = {
              Name = "rime";        # 极点五笔在第二顺位静静等待
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
