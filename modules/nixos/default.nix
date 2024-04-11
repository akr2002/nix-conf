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
}
