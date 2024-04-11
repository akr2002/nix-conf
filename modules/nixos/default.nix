{lib, ...}: {
  imports = [
    ./bluetooth
    ./bootloader
    ./display-manager
    ./editor
    ./environment
    ./filesystem
    ./fonts
    ./hardware
    ./hyprland
    ./kernel
    ./locale
    ./networking
    ./packages
    ./sound
    ./ssh
    ./virtualisation
  ];

  nix = {
    settings = {
      experimental-features = ["nix-command" "flakes"];
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 15d";
    };
  };

  nixpkgs.config.allowUnfree = true;

  services = {
    gvfs.enable = true;
    printing.enable = true;
    upower.enable = true;
    uptimed.enable = true;
  };

  programs = {
    dconf.enable = true;
    zsh.enable = true;
  };

  # enable modules
  bluetooth.enable = lib.mkDefault true;
  display-manager.enable = lib.mkDefault true;
  editor = lib.mkDefault true;
  hardware = lib.mkDefault true;
  hyprland = lib.mkDefault false;
  networking = lib.mkDefault true;
  sound = lib.mkDefault true;
  ssh = lib.mkDefault true;
  virtualisation = lib.mkDefault true;
}
