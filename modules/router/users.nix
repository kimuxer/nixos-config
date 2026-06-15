# hosts/router/users.nix
{ ... }:

{
  programs.neovim = {
      enable = true;
      package = pkgs.neovim-unwrapped;
      viAlias = true;
      vimAlias = true;
  };

  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "prohibit-password"; 
      PasswordAuthentication = false;
      PermitEmptyPasswords = false;
    };
  };

  users.users.root = {
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOxnON3MkP3jq6+UKldz4ChA2OSf07KryKUsJBXeB5wD 604719@qq.com"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIpvPtSvAEllUr4VsEJBcsCs9CHhIvz4vwml/j3mV2v0 win-desktop"
    ];
  };

  users.users.naiveproxy = {
    isSystemUser = true; # 创建一个系统用户（无法登录，仅供服务使用）
    group = "naiveproxy";
  };

  users.groups.naiveproxy = {};
}
