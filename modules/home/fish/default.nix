{ pkgs, ... }:
{
  # ==============================
  # 1. 自动展开的缩写
  # 输入别名 → 按空格/回车 → 自动展开成完整命令
  # ==============================
  programs.fish = {
    enable = true;
    enableAbbreviations = true;

    # 所有别名 → 全部变成 Fish 自动展开缩写
    abbreviations = {
      # 基础工具替换
      cat   = "bat";
      top   = "btm";
      df    = "duf";
      du    = "dust";
      grep  = "rg";
      find  = "fd";
      man   = "tldr";
      ls    = "eza --icons";
      ll    = "eza -lh --icons --git";
      la    = "eza -a --icons";
      lt    = "eza --tree --icons --level 3";
      cls   = "clear";
      q     = "exit";

      # Git 缩写（自动展开）
      gi     = "git init";
      gs    = "git status";
      ga    = "git add .";
      gc    = "git commit -m";
      gp    = "git push";
      gl    = "git pull";
      gd    = "git diff";

      # NixOS 系统命令
      ns    = "sudo nixos-rebuild switch --flake .#nixos";
      nb    = "sudo nixos-rebuild boot --flake .#nixos";
      nt    = "sudo nixos-rebuild test --flake .#nixos";
      nc    = "sudo nix-collect-garbage -d";
      no    = "nix-store --optimise";
    };

    # 不显示欢迎语
    interactiveShellInit = ''
      set -g fish_greeting ""
    '';
  };

  # ==============================
  # 3. zoxide 智能目录跳转
  # ==============================
  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };

}

