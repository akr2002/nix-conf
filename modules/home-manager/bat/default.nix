{
  config,
  lib,
  ...
}: {
  options = {
    bat.enable = lib.mkEnableOption "enable bat";
  };
  config = lib.mkIf config.bat.enable {
    programs.bat = {
      enable = true;
      config = {
        theme = "ansi";
      };
    };
  };
}
