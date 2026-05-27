-- /etc/nixos/modules/home/hyprland/config/autostart.lua

hl.on("hyprland.start", function()
    hl.exec_cmd("fcitx5 -d --replace")
    hl.exec_cmd("udiskie --smart-tray")
    hl.exec_cmd("dms run")
end)
