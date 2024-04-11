{lib, ...}: {
  imports = [
    ./bash
    ./session-vars
    ./zsh
  ];

  nixpkgs.config.allowUnfree = true;

  bash.enable = lib.mkDefault true;
  zsh.enable = lib.mkDefault true;
}
