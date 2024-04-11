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
  };
}
