{ ... }:
{
  imports = [
    ./lsp.nix
    ./telescope.nix
  ];
  programs.nixvim.plugins = {
    comment.enable = true;
    diffview.enable = true;
    fugitive.enable = true;
    gitsigns = { enable = true; settings.current_line_blame = true; };
    leap.enable = true;
    lsp-format.enable = true;
    markdown-preview.enable = true;
    navbuddy.enable = true;
    sniprun.enable = true;
    vim-surround.enable = true;
    telescope.enable = true;
    treesitter.enable = true;
    treesitter-context.enable = true;
    trouble.enable = true;
    web-devicons.enable = true;
  };
}
