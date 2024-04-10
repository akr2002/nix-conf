{
  config,
  lib,
  ...
}: {
  options = {
    display-manager.enable = lib.mkEnableOption "enable display-manager";
  };
  config = lib.mkIf config.display-manager.enable {
    services = {
      xserver = {
        enable = true;
        displayManager = {
          sddm.enable = true;
          gnome.enable = false;
        };
        desktopManager = {
          plasma6.enable = true;
          gnome.enable = false;
        };
      };
      wayland.enable = true;
    };

    programs.xwayland.enable = true;
  };
}
