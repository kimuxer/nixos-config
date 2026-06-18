{ inputs, ... }:
{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia = {
    enable = true;
    systemd.enable = false;
    settings = {
      location.address = "Dalian, CN";
    };
  };
}
