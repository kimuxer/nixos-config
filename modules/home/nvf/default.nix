{ inputs, ... }:
{
  imports = [
    inputs.nvf.homeManagerModules.default
    ./keymaps.nix
  ];

  programs.nvf = {
    enable = true;

    settings.vim = {
      viAlias = true;
      vimAlias = true;
      syntaxHighlighting = true;
      options = {
        mouse = "a";
        tabstop = 2;
        shiftwidth = 0;
        autoindent = true;
        smartindent = false;
        cursorlineopt = "both";
      };

      # === 核心插件区 ===
      lsp.enable = true;
      autocomplete.nvim-cmp.enable = true;
      binds.whichKey.enable = true;
      binds.cheatsheet.enable = true;

      # 启用 Telescope（它会自动注册 <leader>ff 等快捷键）
      telescope.enable = true;

      treesitter = {
        enable = true;
        indent.enable = false;
      };

      languages = {
        enableTreesitter = true;
        enableFormat = true;
        nix.enable = true;
        fish.enable = true;
        lua.enable = true;
        rust.enable = true;
      };

      statusline.lualine = {
        enable = true;
        theme = "auto";
      };

      clipboard = {
        enable = true;
        registers = "unnamedplus"; # 自动使用系统剪贴板，无需额外配置快捷键
        providers.wl-copy.enable = true;
      };

      dashboard.dashboard-nvim = {
        enable = true;
        setupOpts = {
            theme  = "hyper";
            change_to_vcs_root = true; # 开启自动切到项目根目录
          };
        };

      filetree.neo-tree = {
        enable = true;
        setupOpts = {
          add_blank_line_at_top = true;
          git_status_async = true;
        };
      };
    };
  };
}
