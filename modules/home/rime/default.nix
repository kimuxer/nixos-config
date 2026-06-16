{ pkgs, ... }:

let
  configsource = ../../../configs/rime;
in
{
  home.file = {
    ".local/share/fcitx5/rime" = {
      source = configsource;
      recursive = true;
      onChange = ''
        mkdir -p ~/.local/share/fcitx5/rime
        chmod -R u+w ~/.local/share/fcitx5/rime
        rm -f ~/.local/share/fcitx5/rime/*.bin
        rm -f ~/.local/share/fcitx5/rime/build/*
      '';
    };
    ".local/share/fcitx5/themes/mint-green-dark" = {
      source = "${configsource}/themes";
      recursive = true;
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
          fcitx5-rime
        ];
        settings = {
          addons = {
            classicui.globalSection = {
              Theme = "mint-green-dark";
              DarkTheme = "mint-green-dark";
              "Vertical Candidate List" = "True";
            };
            chttrans = {
              globalSection = {
                Engine = "OpenCC";
                OpenCCS2TProfile = "default";
                OpenCCT2SProfile = "default";
              };
              sections = {
                Hotkey = {
                  "0" = "Control+Shift+Alt+L";
                };
              };
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
