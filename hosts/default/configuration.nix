{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ../../modules/nixos/default.nix
    inputs.home-manager.nixosModules.default
  ];
  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Debug infod
  services.nixseparatedebuginfod.enable = true;

  nix.settings.trusted-users = ["root" "user"];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.user = {
    isNormalUser = true;
    description = "user";
    shell = pkgs.zsh;
    extraGroups = ["networkmanager" "wheel" "libvirtd" "qemu" "qemu-kvm" "vo" "docker" "lxc" "incus-admin"];
    packages = with pkgs; [
      kate
      vim
      libvirt
      spice-gtk
      qemu
      qemu_kvm
      virt-viewer
      virt-manager
      OVMF
      dnsmasq
      networkmanagerapplet
    ];
  };

  users.users.root = {
    subUidRanges = [
      {
        count = 1000;
        startUid = 1000;
      }
    ];
    subGidRanges = [
      {
        count = 1000;
        startGid = 1000;
      }
    ];
  };

  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users = {
      "user" = import ./home.nix;
    };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?
}
