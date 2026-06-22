{ ... }:

{
  programs.ghostty = {
    enable = true;
    systemd.enable = true;
    enableFishIntegration = false;
    settings = {
      font-size = 12;
      font-family = "JetBrainsMono Nerd Font";
      window-decoration = false;
      window-save-state = "never";
      gtk-single-instance = false;
    };
  };
}
