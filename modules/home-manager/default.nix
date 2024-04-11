{lib, ...}: {
  imports = [
    ./bash
    ./session-vars
  ];

  nixpkgs.config.allowUnfree = true;

  bash.enable = lib.mkDefault true;
}
