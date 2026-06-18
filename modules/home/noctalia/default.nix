{ inputs, ... }:
{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia = {
    enable = true;
    systemd.enable = false;
    settings = {
      shell.lang = "zh_CN";
      location.address = "Dalian, CN";
    };
  };
}
