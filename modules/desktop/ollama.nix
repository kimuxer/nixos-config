# -- modules/desktop/ollama.nix --
{ pkgs, ... }:
{
  # 启用并配置 Ollama
  services.ollama = {
    enable = true;
    package = pkgs.ollama-cuda;

    loadModels = [
      "deepseek-r1:14b"
    ];
  };
}
