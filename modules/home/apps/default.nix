{ pkgs, inputs, ... }:

{

  home.packages = [
    # 1. 引用你在 flake.nix 中通过 inputs 引入的、特定架构的 Zen Browser 包
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    
    # 2. 安装其他没有专属 HM 模块的应用程序
    pkgs.zed-editor
  ];
}
