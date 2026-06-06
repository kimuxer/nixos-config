{ pkgs, ... }:
{
  programs.gtklock = {
    enable = true;
    modules = [
      pkgs.gtklock-powerbar-module
      pkgs.gtklock-userinfo-module
    ];
  };
}
