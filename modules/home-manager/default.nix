{lib, ...}: {
  imports = [
    ./bash
    ./bat
    ./browsers
    ./fonts
    ./gnome-utils
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
  gnome-utils.enable = lib.mkDefault false;
  kitty.enable = lib.mkDefault true;
  neovim.enable = lib.mkDefault true;
  tmux.enable = lib.mkDefault true;
  vscode.enable = lib.mkDefault true;
  zsh.enable = lib.mkDefault true;
}
