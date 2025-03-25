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
        displayManager = {
          defaultSession = "plasma";
          gdm.enable = true;
        };
        desktopManager = {
          gnome.enable = false;
        };
        xkb = {
          layout = "us";
          variant = "";
        };
      };
      desktopManager.plasma6.enable = true;
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
