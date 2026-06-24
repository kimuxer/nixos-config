{ pkgs, ... }:

let
  logoFile = pkgs.writeText "fastfetch-logo.txt" ''
   _  ___      ____  ____
  / |/ (_)_ __/ __ \/ __/
 /    / /\ \ / /_/ /\ \
/_/|_/_//_\_\\____/___/
'';
in
{

  programs.fastfetch = {
    enable = true;

    settings = {
      logo = {
        source = "${logoFile}";
        position = "top";
        padding.left = 3;
      };

      display = {
        key.width = 14;
        separator = "";
      };

      modules = [
        { type = "custom";   key = "╭── system ──────┄"; }
        { type = "os";       key = "│  os    "; }
        { type = "kernel";   key = "│  kernel"; }
        { type = "wm";       key = "│  wm    "; }
        { type = "shell";    key = "│  shell "; }
        { type = "terminal"; key = "│  term  "; }
        { type = "memory";   key = "│  mem   "; }
        { type = "colors";   key = "╰─┄"; symbol = "circle"; }
      ];
    };
  };
}
