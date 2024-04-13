{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    gnome-utils.enable = lib.mkEnableOption "enable gnome-utils";
  };
  config = lib.mkIf config.gnome-utils.enable {
    home.packages =
      (with pkgs; [
        gnome.gnome-tweaks
        gnome-extension-manager
      ])
      ++ (with pkgs.gnomeExtensions; [
        user-themes
        blur-my-shell
      ]);
  };
}
