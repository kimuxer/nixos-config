{ pkgs, ... }:

{
  programs.jujutsu = {
    enable = true;
    settings = {
      # 核心身份
      user = {
        name = "Kim";
        email = "4003419+kimuxer@users.noreply.github.com";
      };

      # 界面与编辑器
      ui = {
        editor = "nvim";
        graph-style = "curved";
      };

      # Git 安全防护
      git = {
        protected-branches = ["main", "master"];
      };

      # 提效缩写
      aliases = {
        "l" = ["log"];
        "st" = ["status"];
        "sw" = ["new"];
        "sq" = ["squash"];
      };
    };
  };

  programs.jjui = {
    enable = true;
  };

  programs.difftastic = {
    enable = true;
    jujutsu.enable = true;
  };
}
