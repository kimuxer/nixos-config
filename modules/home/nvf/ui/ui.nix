# -- modules/home/nvf/ui/ui.nix --
{ ... }:
{
  programs.nvf.settings.vim = {
    notify.nvim-notify.enable = true;
    mini.icons.enable = true;
    mini.pairs.enable = true;
    mini.indentscope.enable = true;
    mini.files.enable = true;

    mini.statusline = {
      enable = true;
      setupOpts = {
        use_icons = true;
      };
    };

    theme = {
      enable = true;
      name = "gruvbox";
      style = "dark";
    };

    ui = {
      noice.enable = true;
      noice.setupOpts = {
        cmdline = {
          enabled = true;
          view = "cmdline_popup";
          opts = {
            position = {
              row = "50%";
              col = "50%";
            };
          };
        };

        lsp = {
          override = {
            "vim.lsp.util.convert_input_to_markdown_lines" = true;
            "vim.lsp.util.stylize_markdown" = true;
            "cmp.entry.get_documentation" = true;
          };
          signature = {
            enabled = true;
            auto_open = {
              enabled = true;
              trigger = true;
              #luasnip = true;
              throttle = 50;
            };
          };
        };
      };
    };
  };
}
