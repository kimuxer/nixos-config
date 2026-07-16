# -- modules/desktop/ollama.nix --
{ pkgs, ... }:
{
  # 启用并配置 Ollama
  services.ollama = {
    enable = true;
    package = pkgs.ollama-cuda;

    loadModels = [
      "qwen2.5-coder:7b"
    ];
  };
}
