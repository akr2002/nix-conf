{
  config,
  lib,
  pkgs,
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
        xkb = {
          layout = "us";
          variant = "";
        };
      };
      #wayland.enable = true;
    };
    environment.systemPackages = with pkgs; [
      dunst
      grim
      (gnomeExtensions.withPackages (
        ps:
          with ps; [
            autohide-battery
            aylurs-widgets
            bluetooth-battery
            clipboard-indicator
            hide-activities-button
            hide-top-bar
            ideapad-controls
            lock-keys
            maximize-to-empty-workspace
            media-controls
            openweather
            system-monitor-next
            wireless-hid
          ]
      ))
      kernelModules.ksystemstats
      libsForQt5.bismuth
      libnotify
      pamixer
      plasma5Packages.bismuth
      rofi-wayland
      swww
      (
        waybar.overrideAttrs (oldAttrs: {
          mesonFlags = oldAttrs.mesonFlags ++ ["-Dexperimental=true"];
        })
      )
      wl-clipboard
      virtiofsd
    ];
    xdg.portal.enable = true;
    programs.xwayland.enable = true;
  };
}
