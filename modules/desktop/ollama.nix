{ config, pkgs, ... }:

{
  # 启用并配置 Ollama
  services.ollama = {
    enable = true;
    package = pkgs.ollama-cuda;

    loadModels = [
      "qwen3.5:9b"
    ];
  };
}
