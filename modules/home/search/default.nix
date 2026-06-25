# -- modules/home/search/default.nix --
{ ... }:
{
  programs.fzf = {
    enable = true;
    enableFishIntegration = true; # 这是灵魂：自动绑定 Ctrl+R, Alt+C 等快捷键

    # 这里是你的视觉偏好设置，让 fzf 看起来既专业又清晰
    defaultOptions = [
      "--height 40%"         # 占据屏幕 40% 的高度，不像那种满屏铺开的复古风
      "--layout=reverse"     # 搜索结果从上往下排，符合现代视觉习惯
      "--border"             # 加个边框更优雅
      "--inline-info"        # 在提示符旁边显示匹配数量
      "--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8" # 这是 TokyoNight/Catppuccin 风格的配色建议
    ];

    # 这段命令定义了当你在终端按 Alt+C 切换目录时，使用什么工具遍历文件
    # 使用 fd 比 find 快得多，且自动忽略 .git 等目录
    changeDirWidgetCommand = "fd --type d --hidden --exclude .git";

    # 这段命令定义了在搜索文件时的逻辑
    fileWidgetCommand = "fd --type f --hidden --exclude .git";
  };

  programs.fd = {
    enable = true;
    hidden = true;
    ignores = [
      ".git"
      ".direnv"       # 如果你用 direnv，排除 .direnv 能极大地加速搜索
      "result"        # Nix 构建产生的软链目录，排除它非常有必要
      "*.bak"
    ];
    extraOptions = [
      "--absolute-path"
    ];
  };

  programs.ripgrep = {
    enable = true;
    arguments = [
      "--smart-case"        # 智能大小写：小写搜索匹配大小写，包含大写则强制精确匹配
      "--hidden"            # 搜索隐藏文件 (但会自动忽略 .git 目录)
      "--glob"              # 定义默认的全局排除规则
      "!**/result/*"        # 强力排除 Nix 的构建目录 (防止搜到庞大的二进制)
      "!**/.direnv/*"       # 排除 direnv 的环境文件
      "!**/.git/*"          # 确保排除 .git (尽管 rg 默认有，但加上更稳妥)
      "--colors=line:style:bold" # 让匹配行加粗显示，更易读
    ];
  };
}
