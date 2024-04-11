{
  config,
  lib,
  ...
}: {
  options = {
    bash.enable = lib.mkEnableOption "enable bash";
  };
  config = lib.mkIf config.bash.enable {
    programs.bash = {
      enable = false;
      bashrcExtra = ''
        . ~/.bashrc
        eval "$(direnv hook bash)"
        eval "$(starship init bash)"
      '';
    };
  };
}
