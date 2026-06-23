# -- modules/desktop/core.nix --
{ pkgs, ... }:
{
  # 通用系统基础能力
  security.polkit.enable = true;
  services.dbus = {
    enable = true;
    packages = [ pkgs.gsettings-desktop-schemas ];
  };
  services.gnome.gnome-keyring.enable = true;
  services.upower.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;
  services.tumbler.enable = true;
  services.fwupd.enable = true;
  services.tuned.enable = true;
  services.openssh.enable = false;

  programs.dconf.enable = true;
  programs.nix-ld.enable = true;

  programs.ssh.extraConfig = ''
    Host *
      ServerAliveInterval 30
      ServerAliveCountMax 3
  '';

  programs.fish.enable = true;

  zramSwap = {
    enable = true;
    memoryPercent = 60;
  };
}
