{ ... }: {
  programs.nixvim.plugins = {
    airline.enable = true;
    airline.settings.powerline_fonts = 1;
    alpha.enable = true;
    alpha.theme = "dashboard";
    bufferline.enable = true;
    neo-tree.enable = true;
    notify.enable = true;
    which-key.enable = true;
  };
}
