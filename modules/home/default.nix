{ ... }:
{
  imports = [
    ./alacritty
    ./doom
    ./fastfetch
    ./fcitx5
    ./firefox
    ./fish
    ./foot
    ./git
    ./helix
    ./jujutsu
    ./mpv
    ./niri
    ./nix-index
    ./noctalia
    ./neovim
    #./nvf
    ./packages
    ./satty
    ./search
    ./starship
    ./themes
    ./yazi
    ./yt-dlp
    ./zed-editor
  ];

  xdg.userDirs.enable = true;
  home.stateVersion = "26.11";
}
