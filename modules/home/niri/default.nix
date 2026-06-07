{ ... }:
{
  imports = [
    ./layout.nix
    ./window-rules.nix
    ./layout-rules.nix
    ./animations.nix
    ./input.nix
    ./output.nix
    ./keybinds.nix
  ];

  programs.niri.settings = {
    hotkey-overlay.skip-at-startup = true;
    spawn-at-startup = [
      { command =[ "fcitx5" "-d" "--replace" ]; }
      { command =[ "noctalia" ]; }
    ];
  };
}
