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
      displayManager = {
        sddm = {
          enable = false;
          wayland.enable = false;
        };
      };
      xserver = {
        enable = true;
        xkb = {
          layout = "us";
          variant = "";
        };
      };
      desktopManager = {
        plasma6.enbale = true;
        gnome.enable = true;
      };
      displayManager = {
        gdm.enable = true;
        defaultSession = "plasma";
      };
      xserver.desktopManager.xfce = {
        enable = true;
        enableXfwm = true;
      };
    };
    environment.systemPackages = with pkgs; [
      dunst
      grim
      kdePackages.ksystemstats
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
