{ ... }:
{
  imports = [
    ./env.nix
    ./layout.nix
    ./window-rules.nix
    ./layout-rules.nix
    ./animations.nix
    ./input.nix
    ./output.nix
    ./keybinds.nix
    ./cursor.nix
  ];

  programs.niri.settings = {
    prefer-no-csd = true;
    hotkey-overlay.skip-at-startup = true;
    spawn-at-startup = [
      {
        command = [
          "fcitx5"
          "-d"
          "--replace"
        ];
      }
      { command = [ "noctalia" ]; }
      { 
        command = [ 
          "sh" 
          "-c" 
          "dbus-update-activation-environment --systemd GTK_THEME=adw-gtk3-dark XDG_DATA_DIRS=\${HOME}/.nix-profile/share:/etc/profiles/per-user/\${USER}/share:/run/current-system/sw/share && systemctl --user restart xdg-desktop-portal-gtk" 
        ]; 
      }
    ];
  };
}
