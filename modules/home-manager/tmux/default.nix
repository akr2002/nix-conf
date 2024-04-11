{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    tmux.enable = lib.mkEnableOption "enable tmux";
  };
  config = lib.mkIf config.tmux.enable {
    programs.tmux = {
      enable = true;
      mouse = true;
      plugins = with pkgs.tmuxPlugins; [
        better-mouse-mode
        #dracula
        #gruvbox
        #nord
        #onedark-theme
        #power-theme
        resurrect
        #tmux-colors-solarized
        tmux-fzf
      ];
      extraConfig = ''
        set-option -g mouse on
        set -g default-terminal "screen-256color"
      '';
    };
  };
}
