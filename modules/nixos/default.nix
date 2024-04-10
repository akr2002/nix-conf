{lib, ...}: {
  imports = [
    ./bluetooth
    ./bootloader
    ./filesystem
    ./hardware
    ./kernel
    ./locale
    ./networking
  ];
}
