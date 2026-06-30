# -- modules/home/nvf/lazy/completion.nix --
{ ... }:
{
  programs.nvf.settings.vim = {
    snippets.luasnip.enable = true;

    autocomplete.blink-cmp = {
      enable = true;
      friendly-snippets.enable = true;

      setupOpts = {
        snippets.preset = "luasnip";

        completion = {
          documentation = {
            auto_show = true;
            auto_show_delay_ms = 500;  # nvf 默认 200，按你之前的偏好改回 500
            window.border = "rounded";
          };
          menu.border = "rounded";
        };

        signature.enabled = true;
      };
    };

    luaConfigPost = ''
      require("luasnip.loaders.from_vscode").lazy_load()
    '';
  };
}
