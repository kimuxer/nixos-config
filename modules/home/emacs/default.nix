{ pkgs, ... }:
{
  nixpkgs.overlays = [ inputs.emacs-overlay.overlays.default ];

  programs.emacs = {
    enable = true;
    package = pkgs.emacs-unstable-pgtk;
  };
  services.emacs = {
    enable = true;
    client.enable = true;
    package = pkgs.emacs-unstable-pgtk;
  };

  home.packages = with pkgs; [
    # Emacs 基础包
    emacsGcc
    clang
    cmake
  ];

  #home.file.".config/doom" = {
  #   source = ./configs;
  #   recursive = true;
  # };
}
