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
    ./mpv
    ./neovim
    ./niri
    ./nix-index
    ./noctalia
    ./packages
    ./starship
    ./themes
    ./yazi
    ./yt-dlp
    ./zed-editor
  ];

  xdg.userDirs.enable = true;
  home.stateVersion = "26.11";
}
