{ inputs, ... }:
{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia = {
    enable = true;
    systemd.enable = true;
    settings = {
      shell.launch_apps_as_systemd_services = true;
      location.address = "Dalian, CN";
    };
    hooks = {
      wallpaper_changed = [ "noctalia:greeter-sync" ];
    };
  };
}
