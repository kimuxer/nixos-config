{ pkgs, ... }:
{
  programs.fastfetch = {
    enable = true;

    settings = {
      logo.type = "none";

      display = {
        key.width = 14;
        separator = "";
      };

      modules = [
        {
          type = "custom";
          format = ''
             _  ___      ____  ____
            / |/ (_)_ __/ __ \/ __/
           /    / /\ \ / /_/ /\ \
          /_/|_/_//_\_\\____/___/
          '';
        }
        { type = "custom";   key = "╭─────────────────────────────┄"; }
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
