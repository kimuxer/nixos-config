{ ... }:
{
  imports = [
    ./alacritty
    ./fastfetch
    ./fcitx5
    ./firefox
    ./fish
    ./foot
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
