{lib, ...}: {
  imports = [
    ./bluetooth
    ./bootloader
    ./display-manager
    ./editor
    ./environment
    ./filesystem
    ./fonts
    ./gaming
    ./hardware
    ./hyprland
    ./kernel
    ./locale
    ./networking
    ./packages
    ./sound
    ./ssh
    ./virtualization
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
  editor.enable = lib.mkDefault true;
  hardware.enable = lib.mkDefault true;
  hyprland.enable = lib.mkDefault true;
  gaming.enable = lib.mkDefault true;
  networking.enable = lib.mkDefault true;
  audio.enable = lib.mkDefault true;
  ssh.enable = lib.mkDefault true;
  virtualization.enable = lib.mkDefault true;
}
