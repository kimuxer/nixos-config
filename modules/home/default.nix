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
    ./firefox
    ./foot
    ./themes
    ./starship
    ./jujutsu
    ./helix
    ./rime
  ];

  xdg.userDirs = {
    enable = true;
    createDirectories = true;
  };
  home.username = "kim";
  home.homeDirectory = "/home/kim";
  home.stateVersion = "26.11";
}
