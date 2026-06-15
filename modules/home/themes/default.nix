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
  xdg.userDirs = {
    enable = true;
    createDirectories = true; # 如果英文文件夹不存在，HM 会自动帮你创建它们

    # 1. 把你需要的英文常用目录指定好
    download = "$HOME/Downloads";
    desktop = "$HOME/Desktop";
    documents = "$HOME/Documents";
    
    # 2. 如果你不需要“视频、音乐、公共、模板”这些烦人的默认目录
    # 直接把它们指向你的 $HOME（家目录），GTK 就会自动在左侧边栏隐藏掉它们！
    music = "$HOME";
    pictures = "$HOME";
    videos = "$HOME";
    templates = "$HOME";
    publicShare = "$HOME";
  };

  home.sessionVariables = {
    GTK_THEME = themeName;
    XCURSOR_THEME = cursorThemeName;
    XCURSOR_SIZE = toString cursorSize;
  };
}
