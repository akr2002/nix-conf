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
          sddm = {
            enable = true;
            wayland = {
              enable = true;
              #compositor = "kwin";
            };
          };
          gdm.enable = false;
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
