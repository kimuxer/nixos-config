# system configuration.nix
{ pkgs, inputs, ... }:

{
  imports = [
    inputs.sops-nix.nixosModules.sops # 👈 系统模块
  ];

  sops = {
    defaultSopsFile = /home/kim/nixos/secrets/secrets.yaml; # 正确路径
    defaultSopsFormat = "yaml";
    age.keyFile = "/var/lib/sops-nix/key.txt";
  };
}
