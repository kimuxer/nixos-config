# -- modules/home/emacs/default.nix --
{ pkgs, config, ... }:
{
  services.emacs = {
    enable = true;
    package = config.programs.emacs.finalPackage;
    client.enable = true;
  };
  programs.emacs = {
    enable = true;
    package = pkgs.emacsWithPackagesFromUsePackage {
      config = ./configs/emacs.el;
      package = pkgs.emacs31-pgtk;
      #package = pkgs.emacs-unstable-pgtk;
      defaultInitFile = true;
      alwaysEnsure = true;
      alwaysTangle = true;
      extraEmacsPackages = epkgs: [
        epkgs.treesit-grammars.with-all-grammars
      ];
    };
  };

  home.packages = with pkgs; [
    clang
    cmake
    shellcheck
    alejandra
    shfmt
    nixd
    taplo
    bash-language-server
  ];
}
