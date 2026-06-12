{ pkgs, ... }:
{
  # ==============================
  # 1. 自动展开的缩写
  # 输入别名 → 按空格/回车 → 自动展开成完整命令
  # ==============================
  programs.fish = {
    enable = true;

    # 所有别名 → 全部变成 Fish 自动展开缩写
    shellAbbrs = {
      # 基础工具替换
      cat = "bat";
      top = "btm";
      df = "duf";
      du = "dust";
      grep = "rg";
      find = "fd";
      man = "tldr";
      cls = "clear";
      q = "exit";

      # Git 缩写（自动展开）
      gi = "git init";
      gs = "git status";
      ga = "git add .";
      gc = "git commit -m";
      gp = "git push";
      gl = "git pull";
      gd = "git diff";

      # NixOS 系统命令
      ns = "sudo nixos-rebuild switch --flake .#nixdevbox";
      nb = "sudo nixos-rebuild boot --flake .#nixdevbox";
      nt = "sudo nixos-rebuild test --flake .#nixdevbox";
      nc = "sudo nix-collect-garbage -d";
      no = "nix-store --optimise";
      nsproxy = "nixos-rebuild switch --flake .#router --target-host root@192.168.10.1";
    };

    # 不显示欢迎语
    interactiveShellInit = ''
      # 去掉fish欢迎语
      set -g fish_greeting ""

      # 终端locale为en
      export LANG=en_US.UTF-8
      export LC_ALL=en_US.UTF-8

      # 启用 Starship
      eval "$(${pkgs.starship}/bin/starship init fish)"

      # 开启终端时运行一次fastfetch
      if status is-interactive
        fastfetch
      end
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
