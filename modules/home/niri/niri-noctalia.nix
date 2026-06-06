{ inputs, pkgs, ...}:
{
  imports = [
    inputs.noctalia.homeModules.default
    ./layout.nix
    ./window-rules.nix
    ./layout-rules.nix
    ./animations.nix
    ./input.nix
    ./output.nix
    ./keybinds.nix
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
          copy_to_clipboard = true; # 截图后自动复制到剪贴板
          freeze_screen = true;      # 截图时定格画面，操作更从容
      
          # 配合标注工具：截图后直接弹出 Satty 进行编辑
          pipe_to_command = true;
          pipe_command = "satty -f -"; 
        };

        session = {
          actions = [
            { 
              action = "lock"; 
              command = "gtklock"; # 这里填入你之前配置的锁屏命令
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
          margin_edge = 2; # 留空边距，营造悬浮感
          margin_ends = 2; # 缩短两端边距，让 Bar 更长
          start = [ "launcher" "workspaces" ];
          center = [ "clock" ];
          end = [ "media" "tray" "notifications" "clipboard" "volume" "control-center" "session"]; # 把你最常用的挂件放在这里
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
  
  programs.niri.settings = {
    hotkey-overlay.skip-at-startup = true;
    spawn-at-startup = [
      { command =[ "fcitx5" "-d" "--replace" ]; }
      { command =[ "noctalia" ]; }
    ];
  };
}
