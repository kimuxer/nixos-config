{ ... }:
{
  programs.nvf.settings.vim.options = {
    mouse = "a";
    tabstop = 2;
    shiftwidth = 0;
    cursorline = true;
    swapfile = false;
    relativenumber = true;
    expandtab = true;
    smartindent = true;
    wrap = false;
    wildignore = [
      "*/.git/*",
      "*/build/*",
      "*/dist/*",
      "*/node_modules/*",
      "*/result*",
      "*/.direnv/*",
      ];
  };
}
