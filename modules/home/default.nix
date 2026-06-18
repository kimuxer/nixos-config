{ ... }:
{
  imports = [
    ./fcitx5
    ./fish
    ./foot
    ./git
    ./helix
    ./jujutsu
    ./firefox
    ./macchina
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
