{ ... }:
{
  imports = [
    ./niri
    ./apps
    ./fish
    ./git
    ./kitty
    ./fastfetch
    ./nixvim
    ./yazi
  ];

  home.shellAliases = {
    # 基础工具替换
    #sudo = "doas";
    cat = "bat";
    top = "btm";
    df  = "duf";
    du  = "dust";
    grep = "rg";
    find = "fd";
    man = "tldr";
    ls  = "eza --icons";
    ll  = "eza -lh --icons --git";
    la  = "eza -a --icons";
    lt  = "eza --tree --icons --level 2";
    cls = "clear";
    q   = "exit";

    # Git 缩写 (保留在 shellAliases 中作为全能别名)
    g   = "git";
    gs  = "git status";
    ga  = "git add";
    gc  = "git commit -m";
    gp  = "git push";
    gl  = "git pull";
    gd  = "git diff";
    gui = "gitui";

    # NixOS 系统维护命令
    ns = "sudo nixos-rebuild switch --flake .#nixos --impure";
    nb = "sudo nixos-rebuild boot --flake .#nixos --impure";
    nt = "sudo nixos-rebuild test --flake .#nixos --impure";
    nc = "sudo nix-collect-garbage -d";
    no = "nix-store --optimise";

  };
}
