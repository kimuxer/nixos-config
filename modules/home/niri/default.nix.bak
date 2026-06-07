{ inputs, pkgs, ... }:
{
  imports =[
    inputs.dms.homeModules.dank-material-shell
    inputs.dms.homeModules.niri
    inputs.dms-plugins.modules.default

    ./env.nix
    ./layout.nix
    ./window-rules.nix
    ./animations.nix
    ./input.nix
    ./output.nix
    ./binds.nix
    ./cursor.nix
    #./danksearch.nix
  ];

  programs.dank-material-shell = {
    enable = true;
    dgop.package = pkgs.dgop;
    quickshell.package = pkgs.quickshell;
    
    systemd = {
      enable = false;             # Systemd service for auto-start
      restartIfChanged = true;    # Auto-restart dms.service when dank-material-shell changes
    };

    # Core features
    enableSystemMonitoring = true;     # System monitoring widgets (dgop)
    enableVPN = false;                  # VPN management widget
    enableDynamicTheming = true;       # Wallpaper-based theming (matugen)
    enableAudioWavelength = true;      # Audio visualizer (cava)
    enableCalendarEvents = true;       # Calendar integration (khal)
    enableClipboardPaste = true;       # Pasting items from the clipboard (wtype)

    niri = {
      includes = {
        enable = true;
        override = true;
        originalFileName = "hm"; 
        filesToInclude = [         
          "alttab"         
          "binds"
          "colors"
          "layout"
          "outputs"
          "wpblur"
          "cursor"
          "windowrules"
        ];
      };
      enableSpawn = true;    # 跟随niri启动
    };
  };

  # 保持你的自启动项
  programs.niri.settings = {
    hotkey-overlay.skip-at-startup = true;
    spawn-at-startup = [
      { command =[ "fcitx5" "-d" "--replace" ]; }
     # { command =[ "udiskie" "--smart-tray" ]; }
    ];
  };
}
