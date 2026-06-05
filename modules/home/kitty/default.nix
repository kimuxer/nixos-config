{ ... }:
{
  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrainsMono NF SemiBold";
      size = 10;
    };

    settings = {
      window_padding_width = 12;
      window_border_width = 0;
      window_margin_width = 0;
      active_border_color = "none";
      hide_window_decorations = "yes";
      confirm_os_window_close = 0;
      enable_audio_bell = "no";

      tab_bar_style = "hidden";
      tab_bar_show_action = "no";

      background_opacity = "0.9";
      dynamic_background_opacity = "yes";
      background_blur = 0;

      linux_display_server = "wayland";
      repaint_delay = 16;
      input_delay = 1;
      sync_to_monitor = "yes";

      cursor_shape = "block";
      cursor_blink_interval = 0;
      copy_on_select = "yes";
      mouse_hide_wait = "3.0";
    };

    keybindings = {
      "ctrl+shift+t" = "no_op";
      "ctrl+shift+n" = "no_op";
    };
  };
}
