{
  config,
  lib,
  ...
}: {
  options = {editor.enable = lib.mkEnableOption "enable editor";};
  config = lib.mkIf config.editor.enable {
    programs.neovim = {
      enable = true;
      defaultEditor = true;
    };
  };
}
