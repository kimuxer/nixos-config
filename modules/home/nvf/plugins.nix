# -- modules/home/nvf/plugins.nix
{ ... }:
{
  programs.nvf.settings.vim = {
    mini = {
      ai.enable = true;
      animate.enable = true;
      basics.enable = true;
      clue.enable = true;
      comment.enable = true;
      completion.enable = true;
      cursorword.enable = true;
      diff.enable = true;
      extra.enable = true;
      files.enable = true;
      fuzzy.enable = true;
      git.enable = true;
      hipatterns.enable = true;
      icons.enable = true;
      indentscope.enable = true;
      notify.enable = true;
      pairs.enable = true;
      pick.enable = true;
      snippets.enable = true;
      statusline.enable = true;
      surround.enable = true;
      trailspace.enable = true;
      starter = {
        enable = true;
        setupOpts = {
          items = [
            {
              name = "Edit Flake";
              action = "edit ~/nixos-config/flake.nix";
              section = "Config";
            }
            {
              name = "Edit Config";
              action = "edit ~/nixos-config/modules/home/nvf/default.nix";
              section = "Config";
            }
          ];
        };
      };
    };
  };
}
