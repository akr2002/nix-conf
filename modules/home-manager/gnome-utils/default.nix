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
        user-themes
        blur-my-shell
      ]);
    gtk = {
      enable = true;
      iconTheme = {
        package = pkgs.tela-icon-theme;
        name = "Tela-green";
      };
      theme = {
        package = pkgs.orchis-theme.overrideAttrs {
          installPhase = ''
            runHook preInstall
            bash install.sh -d $out/share/themes -t all -c dark -l --tweaks macos --tweaks solid
            runHook postInstall
          '';
        };
        name = "Orchis-Green-Dark";
      };
    };
  };
}
