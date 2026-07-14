# -- modules/home/nvf/lazy/completion.nix --
{ ... }:
{
  programs.nvf.settings.vim.autocomplete.blink-cmp = {
    enable = true;
    friendly-snippets.enable = true;
    setupOpts = {
      snippets.preset = "default";

      completion = {
        documentation = {
          auto_show = true;
          auto_show_delay_ms = 400;
          window.border = "rounded";
        };
      };
      signature = {
        enabled = true;
      };
    };
  };
}
