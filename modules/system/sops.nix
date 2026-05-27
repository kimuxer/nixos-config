# system configuration.nix
{ pkgs, inputs, ... }:

{
  imports = [
    inputs.sops-nix.nixosModules.sops  # 👈 系统模块
  ];

  sops = {
    secrets = {
      vps_ip = {};
      vps_domain = {};
      hy2 = {};
      vless = {};
    };
    defaultSopsFile = ./secrets/secrets.yaml;  # 正确路径
    age.keyFile = "/home/kim/.config/sops/age/keys.txt";
  };
}

