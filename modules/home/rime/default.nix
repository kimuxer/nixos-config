# /home/kim/nixos/modules/home/rime/default.nix
{ pkgs, ... }:

{
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      waylandFrontend = true;
      addons = with pkgs; [
        fcitx5-rime
        fcitx5-gtk
        qt6Packages.fcitx5-qt
      ];

      settings.globalOptions = {
        ClassicUI = {
          Theme = "../rime/themes";
          Font = "Noto Sans CJK SC, 11";
          PreferTextInTextBuffer = true; # 融入预编辑行，消灭黑方块
        };
      };
    };
  };

  xdg.dataFile."fcitx5/rime" = {
    source = ../../../configs/rime;
    recursive = true;
  };
}
