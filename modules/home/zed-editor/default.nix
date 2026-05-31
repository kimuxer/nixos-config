{ pkgs, ... }:

{
  programs.zed-editor = {
    enable = true;

    # 自动为你下载所需的扩展包（例如 Nix、TOML 高亮支持）
    extensions = [
      "nix"
      "toml"
      "markdown"
    ];

    # 声明式管理 Zed 的 userSettings (对应它的 settings.json)
    userSettings = {
      # --- 1. 编辑器代码字体 (Buffer Font) ---
      buffer_font_family = "JetBrainsMono Nerd Font"; # 使用你系统已全局安装的代码字体
      buffer_font_size = 12;                         # 代码字体大小
      buffer_font_weight = 400;                      # 字体粗细
      line_height = "comfortable";                   # 舒适的行高

      # --- 2. 编辑器界面 UI 字体 ---
      ui_font_family = "Inter";                      # 使用你系统已全局安装的 UI 英文首选字体
      ui_font_size = 14;                             # 侧边栏及界面字体大小

      # --- 3. 内置终端字体 ---
      terminal = {
        font_family = "JetBrainsMono Nerd Font";
        font_size = 12;
      };

      # --- 4. 其他推荐体验参数 ---
      theme = "One Dark";                            # 主题名称（可按喜好修改）
      relative_line_numbers = true;                  # 相对行号（匹配你 NVF 编辑器的阅读习惯）
      vim_mode = false;                              # 是否开启 Vim 快捷键模式（按需改为 true）

      # 缩进参考线
      indent_guides = {
        enabled = true;
        coloring = "indent_aware";
      };
    };
  };
}
