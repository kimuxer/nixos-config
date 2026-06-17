{ ... }:
{
  imports = [
    ./animations.nix
    ./cursor.nix
    ./env.nix
    ./input.nix
    ./keybinds.nix
    ./layer-rules.nix
    ./layout.nix
    ./output.nix
    ./window-rules.nix
  ];

  programs.niri.settings = {
    prefer-no-csd = true;
    hotkey-overlay.skip-at-startup = true;
    spawn-at-startup = [
      {
        command = [
          "fcitx5"
          "-d"
          "--replace"
        ];
      }
      { command = [ "noctalia" ]; }
    ];
  };
}
