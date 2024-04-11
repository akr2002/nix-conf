{lib, ...}: {
  imports = [
    ./bluetooth
    ./bootloader
    ./display-manager
    ./editor
    ./filesystem
    ./fonts
    ./hardware
    ./kernel
    ./locale
    ./networking
    ./packages
    ./sound
    ./ssh
    ./virtualisation
  ];
}
