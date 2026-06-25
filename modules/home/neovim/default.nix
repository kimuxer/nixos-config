# -- modules/home/neovim/default.nix --
{ inputs, pkgs, ... }:
{
  imports = [
    inputs.nvf.homeManagerModules.default
    ./keymaps.nix
    ./autocmds.nix
    ./lsp.nix
  ];

  programs.nvf = {
    enable = true;

    settings.vim = {
      lazy.loader = true;
      mini.icons.enable = true;
      vimAlias = true;
      syntaxHighlighting = true;
      notify.nvim-notify.enable = true;
      git.gitsigns.enable = true;
      autopairs.nvim-autopairs.enable = true;
      comments.comment-nvim.enable = true;
      tabline.nvimBufferline.enable = true;
      binds.whichKey.enable = true;

      ui.noice = {
        enable = true;
      #  lsp.signature.enabled = true;
      };

      extraPackages = [ 
        pkgs.tree-sitter
        pkgs.watchman
      ];

      visuals = {
        indent-blankline.enable = true;
        nvim-cursorline.enable = true;
      };

      options = {
        mouse = "a";
        tabstop = 2;
        shiftwidth = 0;
        smartindent = true;
        expandtab = true;
      };

      # === 核心插件区 ===
      autocomplete.nvim-cmp.enable = true;
      snippets.luasnip.enable = true;
      binds.cheatsheet.enable = true;

      telescope = {
        enable = true;
        extensions = [
          {
            name = "fzf";
            packages = [ pkgs.vimPlugins.telescope-fzf-native-nvim ];
            setup = {
              fzf = {
                fuzzy = true;
                override_generic_sorter = true;
                override_file_sorter = true;
                case_mode = "smart_case";
              };
            };
          }
        ];
      };


      treesitter = {
        enable = true;
        indent.enable = false;
      };

      statusline.lualine = {
        enable = true;
        theme = "auto";
      };

      clipboard = {
        enable = true;
        providers.wl-copy.enable = true;
      };

      dashboard.alpha = {
        enable = true;
        theme = "theta";
        opts.leader = "SPC";
      };

      filetree.neo-tree = {
        enable = true;
        setupOpts = {
          add_blank_line_at_top = true;
          auto_clean_after_session_restore = true;
          git_status_async = true;
        };
      };
    };
  };
}
