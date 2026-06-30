{ ... }:
{
  programs.nvf.settings.vim.keymaps = [
    {
      mode = "n";
      key = "-";
      action = "<CMD>lua MiniFiles.open()<CR>";
      desc = "Open Current directory in MiniFiles";
    }
    {
      mode = "n";
      key = "<Esc>";
      action = "<cmd>nohlsearch<CR>";
    }
    {
      mode = "n";
      key = "<leader>fm";
      action = "<cmd>lua require('conform').format({ async = true, lsp_format = 'fallback' })<CR>";
      desc = "[M]ormat buffer";
    }
    {
      mode = "n";
      key = "<leader>gg";
      action = "<cmd>Neogit<cr>";
      desc = "Show Neogit UI";
    }
    # 系统剪贴板
    {
      mode = ["n" "v"];
      key = "<leader>y";
      action = "\"+y";
      desc = "Yank to system clipboard";
    }
    {
      mode = "n";
      key = "<leader>Y";
      action = "\"+Y";
      desc = "Yank line to system clipboard";
    }
    {
      mode = ["n" "v"];
      key = "<leader>p";
      action = "\"+p";
      desc = "Paste from system clipboard";
    }
  ];
}
