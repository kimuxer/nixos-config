# -- modules/home/nvf/plugins/languages.nix
{pkgs, ...}: 
let 
  options = {
    enable = true;
    lsp.enable = true;
    format.enable = true;
    treesitter.enable = true;
  };
in
{
  programs.nvf.settings.vim = {
    lsp = {
      formatOnSave = true;
      #inlayHints.enable = true;
      #lightbulb.enable = true;

      #   presets = {
      #  tailwindcss-language-server.enable = true;
      #  nixd.enable = true;
      #  taplo.enable = true;
      #  bash-language-server.enable = true;
      #  fish-lsp.enable = true;
      #  lua-language-server.enable = true;
      #};
    };

    languages = {
      enableTreesitter = true;

      nix = {
        enable = true;
        lsp.servers = ["nixd"];
        format.enable = true;
        treesitter.enable = true;
      };
      fish = options;
      lua = options;
      toml = options;
      rust = options;
    };

    treesitter.grammars = with pkgs.vimPlugins.nvim-treesitter.grammarPlugins; [
      kdl
    ];
  };
}
