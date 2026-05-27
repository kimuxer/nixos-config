{ pkgs, lib, ... }:

{
  programs.starship = {
    enable = true;
    settings = {
      "$schema" = "https://starship.rs/config-schema.json";

      # 1. 修正后的全局布局：只放变量，不放任何裸奔的纯文本！
      format = lib.concatStrings [
        "$os"
        "$username"
        "$directory"
        "$git_branch"    # 内部自带 "on "
        "$git_status"
        "$package"       # 内部自带 "is "
        "$rust"          # 内部自带 "via "
        "$python"        # 内部自带 "via "
        "$nodejs"        # 内部自带 "via "
        "$nix_shell"     # 内部自带 "via "
        "$cmd_duration"
        "\n"             # <--- 替换为真实的换行符，强制提示符 ❯ 在下一行
        "$character"
      ];

      add_newline = false;

      # 2. 提示符与目录保持原样
      character = {
        success_symbol = "[❯](bold green)";
        error_symbol = "[❯](bold red)";
      };

      directory = {
        style = "bold cyan";
        format = "[$path]($style) "; # 目录不需要前缀，直接显示
        truncation_length = 3;
      };

      # 3. 【核心修正】：将连接词作为模块的 format 前缀
      
      # Git 分支：只有在 Git 目录时，才会渲染 "on  branch"
      git_branch = {
        symbol = " ";
        style = "bold magenta";
        # 将 "on " 写在模块的最前面
        format = "on [$symbol$branch]($style) "; 
      };

      # Git 状态：紧跟在分支后面
      git_status = {
        format = "([\\[$all_status$ahead_behind\\]]($style) )";
        style = "bold red";
      };

      # 语言包：只有在有 package.json 时，才会渲染 "is 󰏗 v1.0.0"
      package = {
        symbol = "󰏗 ";
        style = "bold orange";
        # 将 "is " 写在最前面
        format = "is [$symbol$version]($style) "; 
      };

      # Rust：只有在 Rust 项目中，才会渲染 "via 󱘗 v1.58"
      rust = {
        symbol = "󱘗 ";
        style = "bold red";
        # 将 "via " 写在最前面
        format = "via [$symbol$version]($style) "; 
      };

      # Python：只有在 Python 项目中，才会渲染 "via  v3.9"
      python = {
        symbol = " ";
        style = "bold yellow";
        # 将 "via " 写在最前面
        format = "via [$symbol$version]($style) "; 
      };

      # Node.js
      nodejs = {
        symbol = " ";
        style = "bold green";
        format = "via [$symbol$version]($style) "; 
      };

      # Nix Shell
      nix_shell = {
        symbol = " ";
        style = "bold blue";
        # 进入 nix-shell 时显示 "via  "
        format = "via [$symbol$state]($style) "; 
      };

      # 4. 其他辅助模块
      cmd_duration = {
        min_time = 500;
        style = "bold gray";
        format = "took [$duration]($style) ";
      };

      os = {
        disabled = false;
        symbols.NixOS = " ";
        style = "bold blue";
        format = "[$symbol]($style) ";
      };

      username = {
        show_always = false;
        style_root = "bold red";
        format = "[$user]($style) [in](bold gray) ";
      };
      hostname.disabled = true;
    };
  };
}