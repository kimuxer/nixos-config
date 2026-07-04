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
    ./niri
    ./nix-index
    ./noctalia
    #./nvf
    #./doom
    ./neovim
    ./packages
    ./search
    ./starship
    ./themes
    ./yazi
    ./yt-dlp
    ./zed-editor
    ./emacs
  ];

  xdg.userDirs.enable = true;
  home.stateVersion = "26.11";
}
