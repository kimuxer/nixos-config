{ pkgs, ... }:

let
  cursorTheme = "Bibata-Modern-Ice";
  cursorSize = 20;

in
{
  gtk.enable = true;

  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = cursorTheme;
    size = cursorSize;
    gtk.enable = true;
    x11.enable = true;
  };

  home.sessionVariables = {
    XCURSOR_THEME = cursorTheme;
    XCURSOR_SIZE = toString cursorSize;
  };

  programs.niri.settings.cursor = {
    hide-when-typing = true;
    theme = cursorTheme;
    size = cursorSize;
  };

  dconf.settings."org/gnome/desktop/interface" = {
    cursor-theme = cursorTheme;
    cursor-size = cursorSize;
  };
}
