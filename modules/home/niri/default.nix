# modules/home/niri/default.nix
{ ... }:
{
  home.file = {
    ".config/niri/config.kdl".text = ''
      // ======================
      //   niri : config.kdl
      // ======================

      include "configs/animations.kdl"
      include "configs/binds.kdl"
      include "configs/cursor.kdl"
      include "configs/environment.kdl"
      include "configs/input.kdl"
      include "configs/layer-rules.kdl"
      include "configs/layout.kdl"
      include "configs/output.kdl"
      include "configs/window-rules.kdl"

      prefer-no-csd
      hotkey-overlay { skip-at-startup; }

     // spawn-at-startup "fcitx5" "-d" "--replace"
     // spawn-at-startup "noctalia"
    '';
    # Copy configs to ~/.config/niri/configs
    ".config/niri/configs" = {
      source = ./configs;
    };
  };
}
