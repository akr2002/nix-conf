_: {
  home.sessionVariables = {
    # default editor
    EDITOR = "nvim";
    NIXPKGS_ALLOW_UNFREE = 1;

    # sshaskpass
    SSH_ASKPASS = "/home/user/.nix-profile/bin/ksshaskpass";
    SSH_ASKPASS_REQUIRE = "prefer";

    # Store git credentials in KDE Wallet
    GIT_ASKPASS = "/home/user/.nix-profile/bin/ksshaskpass";

    WAYLAND_DISPLAY = "wayland-1";
    QT_QPA_PLATFORM = "wayland;xcb";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    SDL_VIDEODRIVER = "wayland";
    CLUTTER_BACKEND = "wayland";
    MOZ_ENABLE_WAYLAND = "1";
    DISPLAY = ":0";
  };
}
