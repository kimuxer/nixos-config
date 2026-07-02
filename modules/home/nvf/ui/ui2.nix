# -- modules/home/nvf/ui/ui.nix --
{ pkgs, ... }:
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

    # 1. 明确关闭旧的 noice 模块
    ui.noice.enable = false;

    # 2. 启用原生的 ui2，并配合精简的分流规则
    ui.ui2 = {
      enable = true;
      setupOpts = {
        msg = {
          targets = {
            progress = "msg";  # LSP 进度条丢给右下角临时小浮窗（配合 cmdheight=0）
            "error" = "pager"; # 严重报错直接弹大浮动窗，防止卡死
          };
        };
      };
    };

    # 3. 配合 ui2 将底部传统的空白行彻底隐形
    options.cmdheight = 0;

    # 4. 代替 noice 的 cmdline_popup：直接引入 nixpkgs 内置的 tiny-cmdline-nvim
    extraPlugins = {
      tiny-cmdline = {
        package = pkgs.vimPlugins.tiny-cmdline-nvim; # 直接使用本地 nixpkgs 提供的包 [1]
        setup = ''
          require('tiny-cmdline').setup({
            border = "rounded",
            position = {
              x = "50%",
              y = "50%"
            }
          })
        '';
      };
    };
  };
}
