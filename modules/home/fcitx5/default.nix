{ pkgs, ... }:
let
  localThemePath = ./themes/mint-green-dark;
  activeTheme = builtins.baseNameOf localThemePath;
  commonAssets = {
    panel = ./assets/panel.svg;
    highlight = ./assets/highlight.svg;
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
          "${activeTheme}" = {
            panelImage = commonAssets.panel;
            highlightImage = commonAssets.highlight;
            theme = localThemePath;
          };
        };
        settings = {
          addons = {
            classicui.globalSection = {
              Theme = activeTheme;
              DarkTheme = activeTheme;
              "Vertical Candidate List" = "True";
            };
          };
        };
      };
    };
  };
}
