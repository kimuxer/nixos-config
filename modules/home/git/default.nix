{ ... }:

{
  programs.delta = {
    enable = true;
    options = {
      features = "decorations";
      side-by-side = true; # 并排显示 diff，非常适合阅读代码
      line-numbers = true;
    };
  };
  programs.git = {
    enable = true;
    settings = {
      core.editor = "hx";

      # 用户信息
      user = {
        name = "Kim";
        email = "4003419+kimuxer@users.noreply.github.com";
      };

      # ⚡ 安全与效率设置
      init.defaultBranch = "main"; # 默认分支名设为 main
      pull.rebase = true; # 拉取时使用 rebase，保持提交历史整洁
      fetch.prune = true; # fetch 时自动清理远程已删除的分支
      push.autoSetupRemote = true; # push 时自动追踪远程分支
    };

    # 定义全局忽略文件，防止乱七八糟的系统垃圾进入仓库
    ignores = [
      ".direnv/" # 忽略 nix-direnv 环境目录
      "result" # 忽略 Nix 构建产生的 result 符号链接
      ".nvimrc" # 忽略个人 IDE 配置
      "*.log"
      ".DS_Store"
      "*.bak"
      "*.backup"
    ];
  };
}
