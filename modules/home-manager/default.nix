{lib, ...}: {
  imports = [
    ./bash
    ./kitty
    ./session-vars
    ./tmux
    ./zsh
  ];

  nixpkgs.config.allowUnfree = true;

  bash.enable = lib.mkDefault true;
  kitty.enable = lib.mkDefault true;
  tmux.enable = lib.mkDefault true;
  zsh.enable = lib.mkDefault true;
}
