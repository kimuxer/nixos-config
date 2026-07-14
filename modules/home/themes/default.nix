# -- modules/home/themes/default.nix --
{ pkgs, ... }:
let
  themeName = "adw-gtk3-dark";
  iconThemeName = "Papirus-Dark";
  cursorThemeName = "Bibata-Modern-Ice";
  cursorSize = 20;
  kvantumTheme = "catppuccin-mocha-lavender";
in
{
  dconf.settings."org/gnome/desktop/interface" = {
    gtk-theme = themeName;
    icon-theme = iconThemeName;
    cursor-theme = cursorThemeName;
    cursor-size = cursorSize;
  };
  gtk = {
    enable = true;
    theme = {
      name = themeName;
      package = pkgs.adw-gtk3;
    };
    iconTheme = {
      name = iconThemeName;
      package = pkgs.papirus-icon-theme;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style.name = "kvantum";
  };

  home.pointerCursor = {
    enable = true;
    name = cursorThemeName;
    package = pkgs.bibata-cursors;
    size = cursorSize;
    gtk.enable = true;
  };

  home.packages = with pkgs; [
    qt6Packages.qt6ct
    libsForQt5.qt5ct
    qt6Packages.qtstyleplugin-kvantum
    libsForQt5.qtstyleplugin-kvantum
    catppuccin-kvantum
  ];

  xdg.configFile."Kvantum/kvantum.kvconfig".text = ''
    [General]
    theme=${kvantumTheme}
  '';

  home.sessionVariables = {
    GTK_THEME = themeName;
    XCURSOR_THEME = cursorThemeName;
    XCURSOR_SIZE = toString cursorSize;
  };
}
