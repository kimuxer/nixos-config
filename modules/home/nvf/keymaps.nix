# -- modules/home/neovim/keymaps.nix --
{ ... }:
{
  programs.nvf.settings.vim.keymaps = [
    # 基础文件操作
    { mode = "n"; key = "<leader>w"; action = "<cmd>w<CR>"; desc = "Save File"; }
    { mode = "n"; key = "<leader>W"; action = "<cmd>wa<CR>"; desc = "Save All"; }
    { mode = "n"; key = "<leader>q"; action = "<cmd>q!<CR>"; desc = "Quit"; }
    { mode = "n"; key = "<leader>Q"; action = "<cmd>qa!<CR>"; desc = "Quit All"; }

    # 分屏管理组
    { mode = "n"; key = "<leader>s"; action = "<nop>"; desc = " Split Management"; }
    { mode = "n"; key = "<leader>sh"; action = "<cmd>split<CR>"; desc = "Horizontal Split"; }
    { mode = "n"; key = "<leader>sv"; action = "<cmd>vsplit<CR>"; desc = "Vertical Split"; }
    { mode = "n"; key = "<leader>sc"; action = "<cmd>close<CR>"; desc = "Close Current"; }
    { mode = "n"; key = "<leader>so"; action = "<cmd>only<CR>"; desc = "Close Others"; }

    # 窗口跳转与大小调整组
    { mode = "n"; key = "<leader>m"; action = "<nop>"; desc = "󰖯 Movement & Resize"; }
    { mode = "n"; key = "<leader>mh"; action = "<C-w>h"; desc = "Move Left"; }
    { mode = "n"; key = "<leader>mj"; action = "<C-w>j"; desc = "Move Down"; }
    { mode = "n"; key = "<leader>mk"; action = "<C-w>k"; desc = "Move Up"; }
    { mode = "n"; key = "<leader>ml"; action = "<C-w>l"; desc = "Move Right"; }
    { mode = "n"; key = "<leader>m<Up>"; action = "<cmd>resize -2<CR>"; desc = "Resize Up"; }
    { mode = "n"; key = "<leader>m<Down>"; action = "<cmd>resize +2<CR>"; desc = "Resize Down"; }
    { mode = "n"; key = "<leader>m<Left>"; action = "<cmd>vertical resize -2<CR>"; desc = "Resize Left"; }
    { mode = "n"; key = "<leader>m<Right>"; action = "<cmd>vertical resize +2<CR>"; desc = "Resize Right"; }

    # 系统剪贴板操作组
    { mode = ["n" "v"]; key = "<leader>y"; action = "\"+y"; desc = "Yank to clipboard"; }
    { mode = ["n" "v"]; key = "<leader>Y"; action = "\"+Y"; desc = "Yank line to clipboard"; }
    { mode = "n"; key = "<leader>p"; action = "\"+p"; desc = "Paste from clipboard"; }

    # UI 与工具
    { mode = "n"; key = "<leader>u"; action = "<nop>"; desc = "󰔑 UI Toggles"; }
    { mode = "n"; key = "<leader>ul"; action = "<cmd>set nu! rnu!<CR>"; desc = "Toggle Numbers"; }
    { mode = "n"; key = "<leader>uc"; action = "<cmd>nohl<CR>"; desc = "Clear Highlight"; }
  ];
}
