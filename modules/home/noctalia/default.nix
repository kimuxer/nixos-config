{ inputs, config, ... }:
{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia = {
    enable = true;
    systemd.enable = true;
    settings = {
      shell = {
        polkit_agent = true;
        launch_apps_as_systemd_services = true;
        greeter_sync = {
          auto_sync = true;
          privilege_command = "alacritty -e run0";
        };
      };

      location.address = "Dalian, CN";
    };
  };
}
