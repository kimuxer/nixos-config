{ config, pkgs, inputs, ... }:

{
  improts = [
    inputs.danksearch.homeModules.dsearch
  ];
  programs.dsearch = {
    enable = true;

    # 声明式生成 config.toml 配置文件
    config = {
      index_path = "${config.home.homeDirectory}/.cache/danksearch/index";
      listen_addr = "127.0.0.1:43654";
      max_file_bytes = 2097152;
      worker_count = 4;
      index_all_files = true;

      text_extensions = [
        ".txt" ".md" ".nix" ".sh" ".json" 
        ".toml" ".yaml" ".yml" ".py" ".go" 
        ".rs" ".js" ".ts" ".html" ".css"
      ];

      index_paths = [
        {
          path = "${config.home.homeDirectory}";
          max_depth = 4;
          exclude_hidden = true;
          extract_exif = true;
          exclude_dirs = [
            "node_modules" "bower_components" "__pycache__" 
            "site-packages" "venv" ".venv" "target" "dist" 
            "build" "vendor" ".cache" "result"
          ];
        }
        {
          path = "${config.home.homeDirectory}/repos";
          max_depth = 8;
          exclude_hidden = true;
          extract_exif = false;
          exclude_dirs = [
            "node_modules" "target" "dist" "build" 
            ".git" ".idea" ".vscode" ".direnv" "result"
          ];
        }
      ];
    };
  };

  # ⚡ 修正：利用 Home Manager 显式声明 systemd 用户服务
  systemd.user.services.dsearch = {
    Unit = {
      Description = "DankSearch File Indexer and Search Daemon";
      After = [ "graphical-session.target" ];
    };
    Service = {
      # 引用你通过 flake 输入的包中的 dsearch 二进制文件并启动后台模式
      ExecStart = "${inputs.danksearch.packages.${pkgs.stdenv.hostPlatform.system}.default}/bin/dsearch daemon";
      Restart = "on-failure";
      RestartSec = "5s";
    };
    Install = {
      WantedBy = [ "default.target" ];
    };
  };
}
