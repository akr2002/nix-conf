{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {gaming.enable = lib.mkEnableOption "enable gaming";};
  config = lib.mkIf config.gaming.enable {
    programs.steam = {
      enable = true;
      gamescopeSession.enable = true;
    };
    programs.gamemode.enable = true;
    environment.systemPackages = with pkgs; [mangohud protonup-qt lutris bottles heroic];
  };
}
