# -- modules/home/neovim/autocmds.nix --
{ ... }:
let
  flakeDirectory = "${config.home.homeDirectory}/nixos-config";
in
{
  programs.nvf.settings.vim.autocmds = [
    {
      desc = "Edit nvf config";
      event = [ "FileType" ];
      pattern = [ "alpha" ];
      callback = # lua
        ''
          function()
            vim.keymap.set("n", "c", function()
              vim.cmd("edit ${flakeDirectory}/modules/home/neovim/default.nix")
            end, { buffer = true })
          end
        '';
    }
    {
      # 顺便把之前缺失的“恢复光标位置”也用这种方式补上
      event = [ "BufReadPost" ];
      pattern = [ "*" ];
      callback = # lua
        ''
          function()
            local mark = vim.api.nvim_buf_get_mark(0, '"')
            local lcount = vim.api.nvim_buf_line_count(0)
            if mark[1] > 0 and mark[1] <= lcount then
              pcall(vim.api.nvim_win_set_cursor, 0, mark)
            end
          end
        '';
    }
  ];
}
