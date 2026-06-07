{ inputs, ... }: 
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";

    # 【关键追加】将系统的 inputs 转发给 Home Manager 的配置树
    extraSpecialArgs = { inherit inputs; };

    # 定义用户 "kim" 的 Home Manager 配置
    users.kim = import ../home;
  };
}
