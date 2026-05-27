{ ... }:
{
  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.fish = {
    enable = true;

    # greeting 和 function 逻辑保持不变
    interactiveShellInit = ''
      set -g fish_greeting ""
      if test "$TERM" = "xterm-kitty" && command -v fastfetch > /dev/null
        fastfetch
      end
    '';

    functions = {
      yy = ''
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        yazi $argv --cwd-file="$tmp"
        if set cwd (command cat -- "$tmp"); and[ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
          builtin cd -- "$cwd"
        end
        rm -f -- "$tmp"
      '';
    };
  };
}
