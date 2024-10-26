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
    home.packages = with pkgs; [
      kdePackages.kdeconnect-kde
      libsForQt5.kwallet
      libsForQt5.kwallet-pam
      libsForQt5.kwalletmanager
      libsForQt5.ksshaskpass
      plasma5Packages.qtstyleplugin-kvantum
      yakuake
    ];
  };
}
