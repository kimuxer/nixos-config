{
  description = "Kim's NixOS Flake (Flake-Parts)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #桌面环境与合成器 ( Niri + DMS )
    niri.url = "github:sodiboo/niri-flake";
    niri.inputs.nixpkgs.follows = "nixpkgs";
    dms.url = "github:AvengeMedia/DankMaterialShell";
    dms.inputs.nixpkgs.follows = "nixpkgs";
    # Dank-Material-Shell plugins
    dms-plugins = {
      url = "github:AvengeMedia/dms-plugin-registry";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # Dank Search
    danksearch = {
      url = "github:AvengeMedia/danksearch";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    #noctalia.url = "github:noctalia-dev/noctalia-shell/v5";
    #noctalia.inputs.nixpkgs.follows = "nixpkgs";

    zen-browser.url = "github:youwen5/zen-browser-flake";
    zen-browser.inputs.nixpkgs.follows = "nixpkgs";

    # neovim
    nvf.url = "github:NotAShelf/nvf";
    nvf.inputs.nixpkgs.follows = "nixpkgs";

    # 透明代理
    daeuniverse.url = "github:daeuniverse/flake.nix";
    daeuniverse.inputs.nixpkgs.follows = "nixpkgs";

    # 敏感信息加密
    sops-nix.url = "github:mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";
    
    silentSDDM.url = "github:uiriansan/SilentSDDM";
    silentSDDM.inputs.nixpkgs.follows = "nixpkgs";

    # zed-editor
    zed-editor-flake.url = "github:HPsaucii/zed-editor-flake";

    disko.url = "github:nix-community/disko/latest";
    disko.inputs.nixpkgs.follows = "nixpkgs";

  };

  outputs = inputs @ { self, flake-parts, nixpkgs, home-manager, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems =[ "x86_64-linux" ];

      # 开发环境、自定义包在这里定义 (针对每个系统)
      #perSystem = { pkgs, ... }: {
        # 暂时空着
      #};

      # 系统相关的配置放在这里
      flake = {
        nixosConfigurations.nixdevbox = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; }; # 把 inputs 传给所有模块

          modules =[
            ./hosts/desktop
            ./modules/system
          ];
        };
        nixosConfigurations.router = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };

          modules =[
            ./hosts/router
          ];
        };
      };
    };
}
