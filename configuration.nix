# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
# flake-overlays:

{ config, pkgs, lib, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.default
    ];

  # Enable Bluetooth
  hardware.bluetooth = {
      enable = true;
      settings = {
          General = {
              Experimental = "true";
              Enable = "Source,Sink,Media,Socket";
            };
        };
    };

  # Allow non-free firmware
  hardware.firmware = with pkgs; [ firmwareLinuxNonfree ];

  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [ vaapiIntel vaapiVdpau libvdpau-va-gl intel-media-driver ];
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot";
  boot.supportedFilesystems = [ "ntfs" ];

  # Kernel modules
  boot.kernelModules = [ "kvm-intel" "snd-hda-intel" "i8042" "nf_nat_ftp" ];
  boot.extraModprobeConfig = ''
    options snd-hda-intel model=alc255-acer,dell-headset-multi
    options i8042 nopnp=1
  '';
  boot.kernelParams = [ "allow-discards" ];

  boot.kernel.sysctl = {
    "net.ipv4.conf.all.forwarding" = true;
    "net.ipv4.conf.default.forwarding" = true;
  };

  # Setup keyfile
  # boot.initrd.secrets = {
  #   "/crypto_keyfile.bin" = null;
  # };

  fileSystems."/".options = [ "noatime" "nodiratime" "discard" ];
  # Enable swap on luks
  boot.initrd.luks.devices."luks-3b571a97-616b-4dd7-9abb-d1e0491d178a".device = "/dev/disk/by-uuid/3b571a97-616b-4dd7-9abb-d1e0491d178a";
  # boot.initrd.luks.devices."luks-c0ef1093-a74e-4491-8c73-0009d3377c19".keyFile = "/crypto_keyfile.bin";
  boot.initrd.luks.devices."luks-3b571a97-616b-4dd7-9abb-d1e0491d178a".allowDiscards = true;

  # Allow discard on /
  boot.initrd.luks.devices."luks-a09877ce-f520-429a-9f3b-57b073e4d662".device = "/dev/disk/by-uuid/a09877ce-f520-429a-9f3b-57b073e4d662";
  boot.initrd.luks.devices."luks-a09877ce-f520-429a-9f3b-57b073e4d662".allowDiscards = true;

  networking.hostName = "bridge"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager = {
    enable = true;
    unmanaged = [ "virbr0" "docker0" ];
  };

  networking.nftables.enable = true;

  networking.firewall.trustedInterfaces = [ "incusbr0" ];

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_IN";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN";
    LC_NAME = "en_IN";
    LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN";
    LC_TELEPHONE = "en_IN";
    LC_TIME = "en_IN";
  };

  fonts.packages = with pkgs; [
    source-han-serif
    noto-fonts-emoji
    noto-fonts-cjk
  ];

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Enable GNOME desktop environment
  services.xserver.displayManager.gdm.enable = false;
  services.xserver.desktopManager.gnome.enable = false;

  # Enable hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

# Change DNS
networking = {
  extraHosts = ''
    185.199.108.133 raw.githubusercontent.com
  '';
  nameservers = [ "1.1.1.1" "9.9.9.9" ];
  bridges = { incusbr0.interfaces = []; };
  # firewall.extraCommands = ''
  #   iptables -A INPUT incusbr0 -j ACCEPT
  #   iptables -A FORWARD -o incusbr0 -j ACCEPT
  #   iptables -A FORWARD -i incusbr0 -j ACCEPT
  #   iptables -A OUTPUT -o incusbr0 -j ACCEPT
  # '';
};

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
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
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

  nix.settings.trusted-users = [ "root" "user" ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.user = {
    isNormalUser = true;
    description = "user";
    shell = pkgs.zsh;
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "qemu" "qemu-kvm" "vo" "docker" "lxc" "incus-admin" ];
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
    ];
  }; 
  
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
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
        vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
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

    (waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      })
      )

    dunst
    libnotify
    swww
    rofi-wayland
    wl-clipboard
    grim
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
  networking.firewall.allowedTCPPorts = [ 80 443 7860 ];
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
