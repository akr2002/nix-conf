{lib, ...}: {
  imports = [
    ./session-vars
  ];

  nixpkgs.config.allowUnfree = true;
}
