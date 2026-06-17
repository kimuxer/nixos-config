{ pkgs, ... }:
{
  home.file = {
    ".local/share/fcitx5/themes/mint-green-dark" = {
      source = ./themes;
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
          fcitx5-gtk
          qt6Packages.fcitx5-configtool
          qt6Packages.fcitx5-chinese-addons
          qt6Packages.fcitx5-qt
        ];
        settings = {
          addons = {
            classicui.globalSection = {
              Theme = "mint-green-dark";
              DarkTheme = "mint-green-dark";
              "Vertical Candidate List" = "True";
            };
          };
        };
      };
    };
  };
}
