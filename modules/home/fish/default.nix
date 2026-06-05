{ ... }:
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
    };

    # 不显示欢迎语
    interactiveShellInit = ''
      # 去掉fish欢迎语
       set -g fish_greeting ""

       # 终端locale为en
       export LANG=en_US.UTF-8
       export LC_ALL=en_US.UTF-8

       # 统一封装，全部使用 --wraps=eza，这样它们就全部拥有了 eza 的完美补全能力

       function ls --wraps=eza --description 'alias ls=eza --icons'
         eza --icons $argv
       end

       function ll --wraps=eza --description 'alias ll=eza -lh --icons --git'
         eza -lh --icons --git $argv
       end

       function la --wraps=eza --description 'alias la=eza -a --icons'
         eza -a --icons $argv
       end

       function lt --wraps=eza --description 'alias lt=eza --tree --icons --level 3'
         eza --tree --icons --level 3 $argv
       end

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
