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

      # doom emacs
      dmu = "doom upgrade";
      dms = "doom sync --dev";
      dmd = "doom doctor";
      e = "emacsclient -t";

      # jj 缩写
      jjs = "jj status";
      jjn = "jj new";
      jjd = "jj describe";
      jjdm = "jj describe -m";
      jjbm = "jj bookmark move main --to @";
      jjc = "jj git clone";
      jjp = "jj git push";
      jjf = "jj git fetch";
      jjsq = "jj squash";     # 向前合并
      jjdel = "jj abandon";     # 放弃修改
      jjr = "jj rebase -s @ -d";   # jj rebase -s 源节点 -d 目标节点

      # Git 缩写（自动展开）
      gi = "git init";
      gs = "git status";
      ga = "git add .";
      gc = "git commit -m";
      gp = "git push";
      gl = "git pull";
      gd = "git diff";

      # NixOS 系统命令
      ##  --elevate=run0
      nsproxy = "nixos-rebuild switch --flake .#router --target-host root@192.168.10.1";
      #ns = "nixos-rebuild switch --flake .#nixdevbox --elevate=run0";
      #nb = "nixos-rebuild boot --flake .#nixdevbox --elevate=run0";
      #nt = "nixos-rebuild test --flake .#nixdevbox --elevate=run0";
      #nc = "nix-collect-garbage -d --elevate=run0";
      #no = "nix-store --optimise";
      ns = "nh os switch";
      nb = "nh os build";
      nt = "nh os test";
      nc = "nh clean all";
      no = "nix-store --optimise";
      nsrouter = "nh os switch --target-host root@192.168.10.1 -- router";
    };

    # 不显示欢迎语
    interactiveShellInit = ''
      # 去掉fish欢迎语
      set -g fish_greeting ""

      # 终端locale为en
      export LANG=en_US.UTF-8
      export LC_ALL=en_US.UTF-8

      # 添加 Doom Emacs bin 目录到 PATH
      fish_add_path $HOME/.config/emacs/bin

      # 开启终端时运行一次fastfetch
      if status is-interactive
        fastfetch
      end
    '';
  };
}
