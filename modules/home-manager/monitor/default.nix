{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: {
  options = {
    monitor.enable = lib.mkEnableOption "enable monitor";
  };
  config = lib.mkIf config.monitor.enable {
    systemd.user.timers.monitor = {
      Install.WantedBy = [ "timers.target" ];
      Timer = {
        OnBootSec = "1m";
        OnUnitActiveSec = "1m";
        Unit = "monitor.service";
      };
    };
    systemd.user.services.monitor = {
      Unit = {
        Description = "A script to monitor websites.";
      };
      Install = {
        WantedBy = [ "default.target" ];
      };
      Service = {
        ExecStart = "${inputs.monitor.packages.${pkgs.system}.default}/bin/monitor";
      };
    };
  };
}
