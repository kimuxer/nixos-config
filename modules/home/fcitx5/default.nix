{ pkgs, ... }:
let
  themeName = "mint-green-dark";
  themeConf = ./themes/${themeName}/theme.conf;
  commonAssets = {
    panel = ./themes/assets/panel.svg;
    highlight = ./themes/assets/highlight.svg;
  };
in
{
  i18n = {
    inputMethod = {
      type = "fcitx5";
      enable = true;
      fcitx5 = {
        waylandFrontend = true;
        addons = with pkgs; [
          fcitx5-gtk
          qt6Packages.fcitx5-configtool
          qt6Packages.fcitx5-chinese-addons
          qt6Packages.fcitx5-qt
        ];
        themes = {
          "${themeName}" = {
            panelImage = commonAssets.panel;
            highlightImage = commonAssets.highlight;
            theme = themeConf;
          };
        };
        settings = {
          addons = {
            classicui.globalSection = {
              Theme = themeName;
              DarkTheme = themeName;
              "Vertical Candidate List" = "True";
            };
          };
          
          inputMethod = {
            "Groups/0" = {
              "Name" = "Default";
              "Default Layout" = "us";
              "DefaultIM" = "keyboard-us";
            };
            "Groups/0/Items/0" = { "Name" = "keyboard-us"; };
            "Groups/0/Items/1" = { "Name" = "wbpy"; };
            "GroupOrder" = { "0" = "Default"; };
          };
        };
      };
    };
  };
}
