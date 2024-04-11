{
  config,
  lib,
  ...
}: {
  options = {
    bluetooth.enable = lib.mkEnableOption "enable bluetooth";
  };
  config = lib.mkIf config.bluetooth.enable {
    hardware.bluetooth = {
      enable = true;
      settings = {
        General = {
          Experimental = "true";
          Enable = "Source,Sink,Media,Socket";
        };
      };
    };
  };
}
