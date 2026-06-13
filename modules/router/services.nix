{ pkgs, ... }:

{
  # 1. 定义定时器，每天半夜 12 点触发
  systemd.timers."scheduled-shutdown" = {
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar = "00:00:00";
      Persistent = true; # 如果因为某种原因错过了时间，下次开机立即补执行关机（防止意外）
      Unit = "scheduled-shutdown.service";
    };
  };

  # 2. 定义定时器要执行的具体关机命令
  systemd.services."scheduled-shutdown" = {
    script = ''
      ${pkgs.systemd}/bin/shutdown now
    '';
    serviceConfig = {
      Type = "oneshot";
      User = "root";
    };
  };
}
