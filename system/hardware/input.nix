{ config, pkgs, ... }: {
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_CTYPE = "zh_CN.UTF-8";
  };
  #i18n.defaultLocale = "zh_CN.UTF-8";
  i18n.inputMethod = {
    enable = true; 
    type = "fcitx5"; 
    fcitx5 = {
      waylandFrontend = true;
      addons = with pkgs; [
        qt6Packages.fcitx5-chinese-addons 
        qt6Packages.fcitx5-configtool
        qt6Packages.fcitx5-qt
        fcitx5-gtk
        catppuccin-fcitx5
        fcitx5-lua
        fcitx5-rime
      ];
    };
  };
}
