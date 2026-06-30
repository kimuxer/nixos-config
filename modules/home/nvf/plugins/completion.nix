# -- modules/home/nvf/lazy/completion.nix --
{ ... }:
{
  programs.nvf.settings.vim.autocomplete.blink-cmp = {
    enable = true;
    friendly-snippets.enable = true;

    setupOpts = {
     # snippets.preset = "default";

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
}
