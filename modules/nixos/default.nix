{lib, ...}: {
  imports = [
    ./bluetooth
    ./bootloader
    ./filesystem
    ./fonts
    ./hardware
    ./kernel
    ./locale
    ./networking
  ];
}
