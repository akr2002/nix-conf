# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
# flake-overlays:
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
    inputs.home-manager.nixosModules.default
  ];

  # Enable Bluetooth

  # Allow non-free firmware

  # Bootloader.

  # Kernel modules

  # Setup keyfile
  # boot.initrd.secrets = {
  #   "/crypto_keyfile.bin" = null;
  # };

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Select internationalisation properties.

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Enable GNOME desktop environment
  services.xserver.displayManager.gdm.enable = false;
  services.xserver.desktopManager.gnome.enable = false;

  programs.xwayland.enable = true;

  # Debug infod
  services.nixseparatedebuginfod.enable = true;

  # Enable hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # Change DNS

  # Enable dde
  # services.xserver.desktopManager.deepin.enable = true;
  # services.deepin = {
  #     dde-daemon.enable = true;
  #     dde-api.enable = true;
  #     app-services.enable = true;
  #   };

  # Enable dconf
  programs.dconf.enable = true;

  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "us";
    xkb.variant = "";
  };

  xdg.portal = {
    enable = true;
    #extraPortals = [pkgs.xdg-desktop-portal-gtk];
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  programs.zsh.enable = true;

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

  environment = {
    homeBinInPath = true; # Include ~/bin/ in $PATH
    localBinInPath = true; # Include ~/.local/bin in $PATH
    sessionVariables = {
      # tell electron apps to use wayland
      NIXOS_OZONW_WL = "1";
    };
  };

  virtualisation.libvirtd.enable = true;
  virtualisation.waydroid.enable = true;
  virtualisation.docker.enable = true;
  virtualisation.lxc.enable = true;
  virtualisation.lxc.lxcfs.enable = true;
  virtualisation.incus.enable = true;

  # Allow unfree packages
  nixpkgs.config = {
    allowUnfree = true;

    packageOverrides = pkgs: {
      vaapiIntel = pkgs.vaapiIntel.override {enableHybridCodec = true;};
    };
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    git
    #gnome.adwaita-icon-theme
    gnomeExtensions.aylurs-widgets
    gnomeExtensions.system-monitor-next
    gnomeExtensions.wireless-hid
    gnomeExtensions.autohide-battery
    gnomeExtensions.bluetooth-battery
    gnomeExtensions.clipboard-indicator
    gnomeExtensions.lock-keys
    gnomeExtensions.openweather
    gnomeExtensions.media-controls
    gnomeExtensions.ideapad-controls
    gnomeExtensions.maximize-to-empty-workspace
    gnomeExtensions.hide-top-bar
    gnomeExtensions.hide-activities-button
    libsForQt5.bismuth

    plasma5Packages.bismuth

    kdePackages.ksystemstats

    (
      waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ ["-Dexperimental=true"];
      })
    )

    dunst
    libnotify
    swww
    rofi-wayland
    wl-clipboard
    grim

    pamixer

    virtiofsd
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  services.nginx = {
    enable = true;
    virtualHosts = {
      "textgen.bridge" = {
        locations."/".proxyPass = "http://0.0.0.0:7860";
      };
    };
  };

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [80 443 7860];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Nix extra options
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?
}
