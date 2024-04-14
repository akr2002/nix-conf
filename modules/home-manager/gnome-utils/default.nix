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
        gnome-extension-manager
        gtk-engine-murrine
      ])
      ++ (with pkgs.gnome; [
        gnome-tweaks
        gnome-themes-extra
      ])
      ++ (with pkgs.gnomeExtensions; [
        arcmenu
        blur-my-shell
        user-themes
      ]);
    gtk = {
      enable = true;
      iconTheme = {
        package = pkgs.tela-icon-theme;
        name = "Tela-blue";
      };
      theme = {
        package = pkgs.orchis-theme.overrideAttrs {
          installPhase = ''
            runHook preInstall
            bash install.sh -d $out/share/themes -t all -c dark -l --tweaks macos
            runHook postInstall
          '';
        };
        name = "Orchis-Dark";
      };
    };
  };
}
