# -- modules/desktop/kanata.nix --
{ ... }:
{
  services.kanata = {
    enable = true;
    keyboards.default = {
      config = ''
        (defsrc
          caps ralt 1 2 3 4 5 6 7 8 9 h j k l q)
        (defalias
          caps (tap-hold-press 120 150 caps lmet)
          mv_lyr (layer-while-held move_layer)
        )
        (deflayer default
          @caps @mv_lyr 1 2 3 4 5 6 7 8 9 h j k l q)
        (deflayer move_layer
          _ _
          M-S-1 M-S-2 M-S-3 M-S-4 M-S-5 M-S-6 M-S-7 M-S-8 M-S-9
          M-S-h M-S-j M-S-k M-S-l
          M-S-q)
      '';
    };
  };
}
