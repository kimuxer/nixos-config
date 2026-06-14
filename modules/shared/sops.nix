{ inputs, ... }:

{
  imports = [
    inputs.sops-nix.nixosModules.sops
  ];

  sops = {
    # defaultSopsFile = ../../secrets/secrets.yaml; # 移除默认文件
    defaultSopsFormat = "yaml";
    age.keyFile = "/var/lib/sops-nix/key.txt";
  };
}
