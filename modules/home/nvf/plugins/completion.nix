# -- modules/home/nvf/lazy/completion.nix --
{ lib, ... }:
{
  programs.nvf.settings.vim = {
    mini.snippets = {
      enable = true;
      setupOpts = {
        snippets = [
          (lib.generators.mkLuaInline ''require("mini.snippets").gen_loader.from_lang()'')
        ];
      };
    };

    autocomplete.blink-cmp = {
      enable = true;
      friendly-snippets.enable = true;

      setupOpts = {
        snippets.preset = "mini_snippets";

        completion = {
          documentation = {
            auto_show = true;
            auto_show_delay_ms = 400;
            window.border = "rounded";
          };
          menu.border = "rounded";
        };

        # 手动关闭，使用 noice 的 signature help
        signature.enabled = true;
      };
    };
  };
}
