{ ... }:
{
  programs.nvf.settings.vim = {
    projects.project-nvim = {
      enable = true;
      setupOpts = {
        manual_mode = false;
      };
    };

    # 2. 开启 direnv 环境同步插件
    utility.direnv.enable = true;
  };
}
