# -- modules/home/nvf/ui/ui.nix --
{ ... }:
{
  programs.nvf.settings.vim = {
    mini.notify.enable = true;
    mini.icons.enable = true;
    mini.pairs.enable = true;
    mini.indentscope.enable = true;
    mini.files.enable = true;

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
      };
    };

    mini.statusline = {
      enable = true;
      setupOpts = {
        use_icons = true;
      };
    };
  };
}
