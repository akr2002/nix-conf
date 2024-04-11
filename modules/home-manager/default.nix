{lib, ...}: {
  imports = [
    ./bash
    ./kitty
    ./neovim
    ./session-vars
    ./tmux
    ./vscode
    ./zsh
  ];

  nixpkgs.config.allowUnfree = true;

  bash.enable = lib.mkDefault true;
  kitty.enable = lib.mkDefault true;
  neovim.enable = lib.mkDefault true;
  tmux.enable = lib.mkDefault true;
  vscode.enable = lib.mkDefault true;
  zsh.enable = lib.mkDefault true;
}
