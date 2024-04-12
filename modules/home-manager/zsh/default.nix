{
  config,
  lib,
  ...
}: {
  options = {
    zsh.enable = lib.mkEnableOption "enable zsh";
  };
  config = lib.mkIf config.zsh.enable {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      # enableBashCompletion = true;
      oh-my-zsh = {
        enable = true;
        theme = "ys";
        plugins = ["git" "colored-man-pages" "extract" "sudo"];
      };
      initExtra = ''
        eval "$(direnv hook zsh)"
        eval "$(starship init zsh)"
        alias vv=nvim
        alias yt-dlp-1080="yt-dlp -f 'bestvideo[height<=1080]+bestaudio/best[height<=1080]'"
      '';
    };
  };
}