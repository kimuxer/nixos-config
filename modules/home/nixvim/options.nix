{ ... }: {
  programs.nixvim.opts = {
    number = true;
    relativenumber = true;
    incsearch = true;
    expandtab = true;
    shiftwidth = 2;
    tabstop = 2;
    termguicolors = true;
    ignorecase = true;
    smartcase = true;
    mouse = "a";
  };
}
