{ ... }:
{
  imports = [
    ./fastfetch
    ./fcitx5
    ./firefox
    ./fish
    ./foot
    ./ghostty
    ./git
    ./helix
    ./jujutsu
    ./niri
    ./noctalia
    ./packages
    ./starship
    ./themes
    ./yazi
    ./zed-editor
  ];

  xdg.userDirs.enable = true;
  home.stateVersion = "26.11";
}
