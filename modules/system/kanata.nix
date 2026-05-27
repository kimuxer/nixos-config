{ pkgs, config, ... }:
{
  services.kanata = {
    enable = true;
    keyboards.default = {
      config = ''
        ;; 只点名 Caps Lock 这一个键
        (defsrc
          caps)

        (defalias
          ;; 核心修复：将 capslock 改为 caps
          ;; 单击变大写，长按变 Super (LMet)
          cap (tap-hold-press 150 150 caps lmet)
        )

        (deflayer default
          @cap)
      '';
    };
  };
}
