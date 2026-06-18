{ ... }:
{
  imports = [
    ./niri
    ./noctalia
    ./packages
    ./fish
    ./git
    ./zed-editor
    ./fastfetch
    ./yazi
    ./librewolf
    ./foot
    ./themes
    ./starship
    ./jujutsu
    ./helix
    ./fcitx5
  ];

  xdg.userDirs = {
    enable = true;
    createDirectories = true;
  };
  home.username = "kim";
  home.homeDirectory = "/home/kim";
  home.stateVersion = "26.11";
}
