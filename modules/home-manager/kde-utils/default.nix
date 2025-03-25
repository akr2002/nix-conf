{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    kde-utils.enable = lib.mkEnableOption "enable kde-utils";
  };
  config = lib.mkIf config.kde-utils.enable {
    home.packages = with pkgs.kdePackages; [
      kdeconnect-kde
      kwallet
      kwallet-pam
      kwalletmanager
      ksshaskpass
      kwayland
      # kwayland-integration
      plasma-wayland-protocols
      qtstyleplugin-kvantum
      qtwayland
      wayland
      wayland-protocols
      wayqt
      yakuake
    ];
  };
}
