{ ... }:
{
  programs.nvf.settings.vim.keymaps = [
    # 快速保存/退出
    { key = "<leader>w"; mode = "n"; desc = "Save"; action = "<cmd>w<CR>"; }
    { key = "<leader>q"; mode = "n"; desc = "Quit"; action = "<cmd>q!<CR>"; }
    { key = "<leader>W"; mode = "n"; desc = "Save all"; action = "<cmd>wa<CR>"; }
    { key = "<leader>Q"; mode = "n"; desc = "Quit all"; action = "<cmd>qa!<CR>"; }

    { key = "U"; mode = "n"; desc = "Redo"; action = "<C-r>"; }

    # 分屏管理
    { key = "<leader>sh"; mode = "n"; desc = "Horizontal split"; action = "<cmd>split<CR>"; }
    { key = "<leader>sv"; mode = "n"; desc = "Vertical split"; action = "<cmd>vsplit<CR>"; }
    { key = "<leader>sc"; mode = "n"; desc = "Close current split"; action = "<cmd>close<CR>"; }
    { key = "<leader>so"; mode = "n"; desc = "Close other splits"; action = "<cmd>only<CR>"; }

    # 窗口跳转
    { key = "<leader>h"; mode = "n"; desc = "Move left"; action = "<C-w>h"; }
    { key = "<leader>j"; mode = "n"; desc = "Move down"; action = "<C-w>j"; }
    { key = "<leader>k"; mode = "n"; desc = "Move up"; action = "<C-w>k"; }
    { key = "<leader>l"; mode = "n"; desc = "Move right"; action = "<C-w>l"; }

    # 分屏大小调整 (使用 Leader + 方向键)
    { key = "<leader><Up>"; mode = "n"; desc = "Resize up"; action = "<cmd>resize -2<CR>"; }
    { key = "<leader><Down>"; mode = "n"; desc = "Resize down"; action = "<cmd>resize +2<CR>"; }
    { key = "<leader><Left>"; mode = "n"; desc = "Resize left"; action = "<cmd>vertical resize -2<CR>"; }
    { key = "<leader><Right>"; mode = "n"; desc = "Resize right"; action = "<cmd>vertical resize +2<CR>"; }

    # 其他 UI 交互
    { key = "<leader>ln"; mode = "n"; desc = "Toggle line number"; action = "<cmd>set nu! rnu!<CR>"; }
    { key = "<leader>cl"; mode = "n"; desc = "Clear search highlight"; action = "<cmd>nohl<CR>"; }
    { key = "<leader>e"; mode = "n"; desc = "Run neo-tree"; action = "<cmd>Neotree<CR>"; }
   # { key = "<leader>c"; mode = "n"; desc = "Edit nvf config"; action = "<cmd>edit $HOME/nixos/modules/home/nvf/default.nix<CR>"; }
  ];
}
