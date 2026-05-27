{ lib, inputs, pkgs, ... }:
{
  imports = [ inputs.nvf.homeManagerModules.default ];

  programs.nvf = {
    enable = true;

    settings.vim = {
      # ⚡ 依旧保留这一行（确保 wrapped Neovim 能读取本地家目录由 DMS 动态生成的 ~/ .config/nvim/colors/dms.lua）
      luaConfigPre = ''
        vim.opt.rtp:prepend(vim.fn.expand("~/.config/nvim"))
      '';

      # =======================================================
      # 🎨 现代 IDE 核心配置（根据 NVF 官方手册推荐补齐）
      # =======================================================
      languages.enableTreesitter = true;       # ⚡ 开启现代高速语法解析器（极大改善代码着色）
      autocomplete.nvim-cmp.enable = true;     # ⚡ 开启代码自动补全浮动窗口（打字时自动弹出提示）
      languages.nix.enable = true;             # ⚡ 开启 Nix 语言支持（提供 Nil 语法查错与自动格式化）
      binds.whichKey.enable = true;            # ⚡ 开启这个超强的提示器
      # 基础配置
      viAlias = true;
      vimAlias = true;
      lsp.enable = true;
      
      # Neovim 选项
      options = {
        mouse = "a";
        number = true;
        relativenumber = true;
        autoindent = true;
        termguicolors = true;
      };

      # 状态栏 lualine 配置（完全交给 base46 托管，设为 auto 即可自动跟随 dms 变色）
      statusline.lualine = {
        enable = true;
        theme = "auto"; 
      };
    };
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };
}
