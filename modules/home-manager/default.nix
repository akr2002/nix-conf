{lib, ...}: {
  imports = [
    ./bash
    ./bat
    ./kitty
    ./neovim
    ./session-vars
    ./tmux
    ./utils
    ./vscode
    ./zsh
  ];

  nixpkgs.config.allowUnfree = true;

  bash.enable = lib.mkDefault true;
  bat.enable = lib.mkDefault true;
  kitty.enable = lib.mkDefault true;
  neovim.enable = lib.mkDefault true;
  tmux.enable = lib.mkDefault true;
  vscode.enable = lib.mkDefault true;
  zsh.enable = lib.mkDefault true;
}
