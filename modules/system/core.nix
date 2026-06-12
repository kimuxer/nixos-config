{ pkgs, ... }:

{
  # 通用系统基础能力
  security.polkit.enable = true;
  services.dbus.enable = true;
  services.gnome.gnome-keyring.enable = true;
  services.upower.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;
  services.tumbler.enable = true;
  services.fwupd.enable = true;
  services.tuned.enable = true;

  programs.dconf.enable = true;
  programs.nix-ld.enable = true;
  programs.fish.enable = true;

  programs.ssh.extraConfig = ''
    Host *
      ServerAliveInterval 30
      ServerAliveCountMax 3
  '';
}
