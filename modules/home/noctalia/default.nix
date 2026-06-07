{ inputs, ... }:
{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia = {
    enable = true;
    systemd.enable = false;
    settings = {
      shell = {
        time_format = "{:%H:%M}";
        clipboard_auto_paste = "ctrl_shift_v";

        shadow = {
          direction = "down";
          alpha = 0.52;
        };

        panel = {
          transparency_mode = "glass";
          clipboard_placement = "attached";
          wallpaper_placement = "attached";
          session_placement = "attached";
        };
        
        screenshot = {
          save_to_file = true;
          copy_to_clipboard = true;
          freeze_screen = true;
      
          pipe_to_command = true;
          pipe_command = "satty -f -"; 
        };

        session = {
          actions = [
            { 
              action = "lock"; 
              command = "gtklock";
            }
            { 
              action = "logout"; 
              enabled = true; 
            }
            { 
              action = "shutdown"; 
              destructive = true; 
            }
          ];
        };
      };

      bar = {
        order = [ "main" ];
        main = {
          position = "top";
          thickness = 24;
          scale = 0.8;
          margin_edge = 1; # 留空边距
          margin_ends = 2; # 缩短两端边距
          start = [ "launcher" "workspaces" ];
          center = [ "clock" ];
          end = [ "media" "tray" "notifications" "clipboard" "volume" "control-center" "session"];
        };
      };

      wallpaper = {
        directory = "/home/kim/Pictures/wallpapers";
        automation.enabled = true;
      };

      theme = {
        mode = "dark"; 
        source = "wallpaper";      
        wallpaper_scheme = "m3-tonal-spot"; 

        templates = {
          enable_builtin_templates = true;
          enable_community_templates = true;
          # run: noctalia theme --list-templates
          builtin_ids = [ "niri" "foot" "starship" "qt" "gtk3" "gtk4" "cava" ];   
          community_ids = [ "neovim" "papirus-icons" "telegram" "yazi" "zed" "zen-browser" ];
        };
      };

      lockscreen = {
        blurred_desktop = true;
        blur_intensity = 0.5;
        tint_intensity = 0.3;
      };

      location = {
        address = "Dalian, CN";
      };
    };
  };
}
