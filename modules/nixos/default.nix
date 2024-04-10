{lib, ...}: {
  imports = [
    ./bluetooth
    ./bootloader
    ./display-manager
    ./filesystem
    ./fonts
    ./hardware
    ./kernel
    ./locale
    ./networking
  ];
}
