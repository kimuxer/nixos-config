# -- modules/home/nvf/plugins/languages.nix
{ pkgs, ... }:
{
  programs.nvf.settings.vim = {
    projects.project-nvim = {
      enable = true;
    };

    lsp = {
      enable = true;
      formatOnSave = true;
      inlayHints.enable = true;
      lightbulb.enable = true;

      presets = {
        tailwindcss-language-server.enable = true;
        nixd.enable = true;
        taplo.enable = true;
        bash-language-server.enable = true;
        fish-lsp.enable = true;
        gopls.enable = true;
        lua-language-server.enable = true;
      };
    };

    languages = {
      enableFormat = true;
      enableTreesitter = true;
      #    enableDAP = true;

      nix = {
        enable = true;
        lsp.servers = ["nixd"];
      };
      fish.enable = true;
      lua.enable = true;
      toml.enable = true;
      rust.enable = true;
    };

    treesitter.grammars = with pkgs.vimPlugins.nvim-treesitter.grammarPlugins; [
      kdl
    ];
  };
}
